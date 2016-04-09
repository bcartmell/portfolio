var okieModal = (function() {
  var curtainInstance;
  var Curtain = function(options) {
    if (!(this instanceof Curtain)) return new Curtain(options);
    var self = this;

    this.modals = [];

    this.element = document.createElement('div');
    this.element.id = 'modal-curtain';
    this.element.className = 'hidden transition-opacity';

    this.outerWrapper = document.createElement('div');
    this.outerWrapper.id = 'modal-curtain-wrapper';

    // Yet another container in the curtain.
    // fixed positioning messed up vertical center-align
    // so now we need this container to fix it.
    this.innerWrapper = document.createElement('div');
    this.innerWrapper.id = 'modal-curtain-inner';

    this.outerWrapper.appendChild(this.innerWrapper);
    this.element.appendChild(this.outerWrapper);

    document.getElementsByTagName('body')[0].appendChild(this.element);

    this.element.addEventListener('click', function(event) {
      if (event.target === self.element) {
        hideElement(self.element);
      }
    });
    return this;
  };
  Curtain.prototype = {
    addModal: function(modal) {
      this.modals.push(modal);
      this.innerWrapper.appendChild(modal.element);
    },
  };

  function getCurtain() {
    if (!curtainInstance) curtainInstance = new Curtain();
    return curtainInstance;
  }

  function hideElement(element, callback) {
    var className = element.className || '';
    if (className.search('hidden') === -1) {
      element.style.opacity = 0;
      window.setTimeout(function() {
        okieHelpers.addClass(element, 'hidden');
      },okieHelpers.getTransDuration(element));
    }
    element.style.opacity = 0;
    if (callback) callback();
  }

  function showElement(element) {
    element.style.opacity = 0;
    element.className = element.className.replace('hidden', '').trim();
    window.setTimeout(function() {
    element.style.opacity = 1;
    }, 2);
    return element;
  }

  var Modal = function(options) {
    if (!(this instanceof Modal)) return new Modal(options);
    var self = this;

    // setup instance options
    options = options || {};

    this.content = options.content || '';
    this.target = options.target || null;

    // setup primary container
    this.element = document.createElement(options.tagName || 'div');
    this.element.id = options.id || '';
    this.element.className = okieHelpers.cleanSpaces('hidden modal transition-all'+ (options.className || ''));

    // add content

    // if content is an HTMLElement Node
    if (this.content instanceof Node) {                   
      this.element.appendChild(this.content);
    }
    // if content is another object (such as a Slideshow), 
    // it will hold a reference to it's source node as 'element'
    else if (this.content.element instanceof Node) {
      this.element.appendChild(this.content.element);
    }
    // or use provided string as innerHTML;
    else this.element.innerHTML = options.content;


    // add close button
    this.closeButton = document.createElement('i');
    okieHelpers.addClass(this.closeButton, 'fa fa-close modal-close');
    this.element.insertBefore(this.closeButton, this.element.firstChild);

    this.closeButton.addEventListener('click', function(){
      self.hide();
    });

    // attach to curtain
    this.curtain = getCurtain();
    this.curtain.addModal(this);

    // attach event listener to target.
    if (this.target) {
      this.target.addEventListener('click', function() {
        self.show();
      }, false);
    }

    // so we can capture keyboard events
    this.element.setAttribute('tabIndex', 0); 

    this.element.addEventListener('keydown', function(event) {
      event = event || window.event;
      if (event.keyCode === 27)  {
        try {event.preventDefault();} // Standards-compliant 
        catch(err){ event.returnValue=false;} // IE8
        self.hide();
      }
    }, false);
  };

  Modal.prototype = {
    show: function() {
      this.setMaxHeight();
      showElement(this.curtain.element);
      showElement(this.element);

      // so that keyboard events are detected immediately
      // if our content is another object, we'll let it's element 
      // have focus so that it can also respond to keyboard events
      if (this.content.element) this.content.element.focus();
      else this.content.focus();

      // prevent body scroll while modal is open
      document.body.classList.add('modal-open');
      this.setMaxHeightListener = this.setMaxHeight.bind(this);
      window.addEventListener('resize', this.setMaxHeightListener, false);
      return this;
    },
    hide: function() {
      var curtain = this.curtain;
      var self = this;
      hideElement(this.element, function() {
        hideElement(curtain.element);
        self.content.getCurrentSlide().hide();
      });

      // undo prevent body scroll while modal is open
      document.body.classList.remove('modal-open');
      window.removeEventListener('resize', this.setMaxHeightListener, false);
      return this;
    },
    setMaxHeight: function() {
      if (!this.maxHeightMultiplier) {
        this.maxHeightMultiplier = okieHelpers.maxHeightMultiplier(this.element);
      }
      var maxHeight = okieHelpers.getViewHeight() *this.maxHeightMultiplier +'px';
      this.element.style.maxHeight = maxHeight;
      this.setContentMaxHeight(maxHeight);
    },
    setContentMaxHeight: function(maxHeight) {
      if (this.content.setMaxHeight) this.content.setMaxHeight(maxHeight);
    }
  };

  return {
    newModal: function(options) {
      return new Modal(options);
    }
  };
}());


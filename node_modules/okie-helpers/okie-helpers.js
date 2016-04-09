  var okieHelpers = (function() {
    // A collection of useful utility functions
    'use strict';
    return {
    // Some utility function that I needed at least once
    // but are general enough to warrant extraction from
    // the relevant code for reusability.

      cleanSpaces: function(str) {
        // given a string, make sure that each instance of 
        // white-space is only one space.  This way,
        // you can append strings together without worrying
        // about whether or not you should prepending/appending
        // spaces will help or hurt, just add the spaces and use this function.
        return str.replace(/\s+/g,' ').trim();
      },

      addClass: function(target, newClass) {
        // Add a classList to an element
        // arg one is the target element, arg two
        // is that class list (space-separated).
        var i, max;
        var classArray = newClass.split(' ');
        max = classArray.length;
        for(i=0; i<max; i++) {
          target.classList.add(classArray[i]);
        }
      },

      removeClass: function(target, className) {
        // remove a class from an element.
        target.classList.remove(target);
      },

      getOuterSize: function(target) {
        // Get outer size of an element
        var rect = target.getBoundingClientRect();
        return {
          width: rect.width || (rect.right - rect.left),   
          height: rect.height || (rect.bottom - rect.top) 
        };
      },

      getTransDuration: function(element) {
        return parseFloat(getComputedStyle(element).transitionDuration)*1000;
      },
      
      getViewHeight: function() {
        return window.innerHeight || document.documentElement.clientHeight;
      },

      maxHeightMultiplier: function(element) {
        // allows us to sat heights and max-heights on elements
        // while still respecting percentage-based CSS max-height property

        var cssMaxHeight = getComputedStyle(element).maxHeight;
        // getComputedStyle will get us the value from the stylesheet

        if (cssMaxHeight.indexOf('%') !== -1) {
          return parseFloat(cssMaxHeight)/100;
        }
        return 1;
      },

      isVisible: function(element) {
        return element.offsetWidth > 0 || element.offsetHeight > 0;
      },

      stopEvent: function(event) {
        if (event.preventDefault) event.preventDefault();
        event.stopPropagation();
        event.stopImmediatePropagation();
      }

    };
  }());


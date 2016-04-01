<contact-form>
  <div class="container">
    <form action="/contact" method="post" name="contact-form">
      <legend>
        <h1>
            Contact Brady
        </h1>
      </legend>
  
      <div class="row">
        <input-field class="six columns" type="text" label="First Name" name="firstName" minLength="2" pattern="[A-Za-z]+" required="required">
        </input-field>
    
        <input-field class="six columns" type="text" label="Last Name" name="lastName" minLength="2" pattern="[A-Za-z]+" required="required">
        </input-field>
      </div>
  
      <div class="row">
        <input-field class="six columns" type="text" label="Organization Name" name="company" minLength="2" required="required">
        </input-field>
    
        <input-field class="six columns" type="email" label="Email Address" name="email" minLength="2" required="required">
        </input-field>
      </div>
  
      <div class="row">
        <textarea-field class="twelve columns" name="message" label="Message" maxLength="300" minLength="3" cols="30" rows="10" required="required"></textarea-field>
      </div>
  
      <div class="row">
        <button class="u-pull-right button button-primary six columns" type="submit">
          Send Message
        </button>
      </div>
    </form>
  </div>

  <script>
    this.on('mount', function() {
      $(this.root).find('form').validate();
    });
  </script>

</contact-form>

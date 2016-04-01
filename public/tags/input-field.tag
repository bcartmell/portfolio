<input-field>
  <label for={opts.name}>
    {opts.label}
    <br />
    <input type={opts.type} id={opts.name} name={opts.name} minLength={opts.minLength} pattern={opts.pattern} maxLength={opts.maxLength}>
  </label>

  <script>
    this.on('mount', function() {
      var $field = $(this.root).find('input');
      if (this.opts.required) {
        $field.attr('required', '');
      }
    });
  </script>
</input-field>

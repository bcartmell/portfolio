<textarea-field>
  <label class="block" for={this.opts.name}>
    {this.opts.label}
    <br />
    <textarea type={opts.type} id={opts.name} name={opts.name} minlength={opts.minlength} pattern={opts.pattern} maxlength={opts.maxlength}>
    </textarea>
  </label>

  <script>
    this.on('mount', function() {
      var $field = $(this.root).find('textarea');
      if (this.opts.required) {
        $field.attr('required', '');
      }
    });
  </script>

  <style>
    textarea-field,
    textarea-field label {
      display: block;
      width: 100%;
    }
  </style>
</textarea-field>

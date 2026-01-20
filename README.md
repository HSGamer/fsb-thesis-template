# FSB Thesis Template

A Typst template for Master's theses at FSB (FPT School of Business and
Technology).

## Usage

You can use this template in the Typst web app by searching for `fsb-thesis` or
using the CLI:

```bash
typst init @preview/fsb-thesis:0.1.0 my-thesis
```

## Configuration

The `project` function takes the following arguments:

- `title`: The title of your thesis.
- `author`: Your name.
- `degree`: Your degree (default: "Master of Software Engineering").
- `supervisors`: A list of supervisor names.
- `abstract`: Content for the abstract.
- `acknowledgments`: Content for acknowledgments.
- `bibliography-file`: (Optional, legacy) Path to bibliography file.
- `bib-style`: Bibliography style (default: "ieee").

## Local Development

1. Clone this repository.
2. Edit `lib.typ` to make changes to the template style.
3. Test with `typst compile template/main.typ`.

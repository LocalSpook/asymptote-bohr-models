# Overview
This script allows for the easy creation of Bohr models of atoms,
for use with the [Asymptote Vector Graphics language](https://asymptote.sourceforge.io/).

Copy the [`bohrmodel.asy`](/bohrmodel.asy) file to the directory in which Asymptote is installed.
- On Windows, this is usually `C:\Program Files\Asymptote\`

It will now be accessible in Asymptote scripts with `import bohrmodel;`.

To draw a Bohr model, use the `DrawBohrModel()` function. It has the following parameters:

| Name  | Type  | Default | Description |
| :---: | :---: | :---:   | :---        |
| `electrons_to_sort`  | `int`    | N/A          | The number of electrons in the atom, as a positive integer. This argument is mandatory. |
| `atom_label`         | `string` | `""`         | The label displayed at the center of the model. Supports inline LaTeX math mode with `$ $`. |
| `center_coordinates` | `pair`   | `(0, 0)`     | The coordinate pair which the model will be centered at. |
| `electron_color`     | `pen`    | `currentpen` | The color that the electrons will be drawn in. |
| `atom_label_color`   | `pen`    | `currentpen` | The color that the label will be drawn in. |

# Examples

```asymptote
import bohrmodel;
unitsize(1cm);

DrawBohrModel(28, "Ni", electron_color=blue);
```
![example1](https://user-images.githubusercontent.com/56512186/178093218-bdb29092-1142-4d9f-abd0-406f92ecbf39.svg)
```asymptote
import bohrmodel;
unitsize(1cm);

DrawBohrModel(18, "$\textrm{K}^+$", atom_label_color=RGB(115, 0, 230));
DrawBohrModel(55, "Cs", (8, 0), electron_color=orange, atom_label_color=blue);
```
![example2](https://user-images.githubusercontent.com/56512186/178093511-9c12d5db-79de-493d-bf6f-04ffb07806b8.svg)

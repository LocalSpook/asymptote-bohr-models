void DrawBohrModel(
    int electrons_to_sort,
    string atom_label="",
    pair center_coordinates=(0, 0),
    pen electron_color=currentpen,
    pen atom_label_color=currentpen
    ) {

    // Sort the electrons into shells
    // For convenience, the number of electrons in shell N is stored at sortedElectrons[N]
    int[] sortedElectrons;
    int max_electrons_in_current_shell;
    for (int i = 1;; ++i) {
        max_electrons_in_current_shell = 2*(i)**2;
        if (electrons_to_sort > max_electrons_in_current_shell) {
            sortedElectrons[i] = max_electrons_in_current_shell;
            electrons_to_sort -= max_electrons_in_current_shell;
        } else {
            sortedElectrons[i] = electrons_to_sort;
            break;
        }
    }

    // Draw the shells and electrons
    pair electron_coordinates;
    for (int i = 1; i < sortedElectrons.length; ++i) {
        draw(circle(center_coordinates, i));
        for (real theta = 0; theta < 2pi; theta += (2pi / sortedElectrons[i])) {
            electron_coordinates = (cos(theta)*i + center_coordinates.x,
                                    sin(theta)*i + center_coordinates.y);
            filldraw(circle(electron_coordinates, 0.1), electron_color);
        }
    }

    label(center_coordinates, atom_label, atom_label_color);
}
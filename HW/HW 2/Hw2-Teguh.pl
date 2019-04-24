house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
wizard(grindelwald).
wizard(dumbledore).
muggle(petunia).
muggle(vernon).
magic(X):- house_elf(X).
magic(X):- wizard(X).
magic(X):- witch(X).

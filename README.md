# Heretic + Hexen (2025) Patches for GZDoom

## What This Is

This is a collection of patches for GZDoom that allow users to play with the new features of
Heretic + Hexen by Nightdive Studios, including the new Faith Renewed and Vestiges of Grandeur
episodes.

Note this is very WIP. The hexen patches should mostly work, but the new monsters and weapons in
Heretic have some code pointers that don't directly translate to GZDoom, so some extra work is needed there.

The raw graphics in the rerelease wads are 560x200. The convert.py script can convert them, but I haven't
tested this on a wide range of systems.

# Sumwunn

This fork is tweaked to retain compatibilty with the original IWADs, and to preserve compatibility with any mods. It focuses on the extended maps, so the new monsters and weapons are replaced with original ones, and the Hexen class selector with a brass torch.

I haven't played with the author's image conversion tool, yet.

# PK3 Builder Instructions

- These are the same for Heretic & Hexen (using Heretic for this example):
- Follow the filenames exactly (case matters)

1. You'll need to install DoomTools and 7-Zip. The script will ask for location of DoomTools before proceeding.
2. Open the repo's heretic pk3 builder folder's iwad folder (scripts/pk3builder/heretic_rr_ex_gz-port/iwads) in one window and your "Heretic + Hexen" folder in another.
3. Copy heretic.wad from the H+H's folder (where heretic.exe is) to the iwads folder and rename it to "heretic_new.wad".
4. Do the same for the original IWAD located in H+H's base/heretic folder, and rename it to "heretic_orig.wad".
5. Outside the iwads folder, there are two scripts (one for Linux & Windows). You should be able to run the script, and if there's no errors, you're good to use the pk3 (see Load Orders below).

# Load Orders

Remember, for this we are using the original IWADS (ones in H+H's base folder, and also applies to hexdd.wad).

**Heretic EX**: heretic.wad + heretic_ex.wad + heretic_rr_ex-gz-port.pk3

**Heretic FR**: heretic.wad + heretic_fr.wad + heretic_rr_ex-gz-port.pk3

**Hexen EX**: hexen.wad + hexen_ex.wad + hexen_rr_ex-gz-port.pk3

**Hexdd EX**: hexen.wad + hexdd.wad + hexdd_ex.wad + hexen_rr_ex-gz-port.pk3

**Hexen VoG**: hexen.wad + hexen_vog.wad + hexen_rr_ex-gz-port.pk3

# New Music

1. Download TrakPlayer mod: https://www.moddb.com/mods/trakplayer
2. Add TrakPlayer.pk3, heretic_mus_orig.wad, and heretic_mus_remix.wad to load order (Hexen works the same).
3. Music should work, and you can swap between Remix & MIDI in GZDoom's Sound Options (requires map reload or next map).

Additionally, the changemus command works. Using it without parameters shows the track name (remix starts with R_; midi with O_). Can swap accordingly.

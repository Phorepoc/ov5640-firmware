# ov5640-firmware

The OV5640 autofocus firmware (`ov5640_af.bin`) as a Catalogue package for the PinePhone's rear camera
(camera-a64). No binary is committed: `recipes/fetch.sh` downloads the file from its upstream at a pinned commit and
checks its SHA-512 (`sources.lock`); `recipes/sis.sh` packages it to `\resource\firmware\ov5640_af.bin`.

The file is OmniVision's, with no licence; see NOTICE. The camera works without it, with fixed focus.

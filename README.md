![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_MouseUpEvent

The `On Mouse Up` form event for picture objects, used to implement click-and-drag interactions. Originally published by 4D as a **HDI** (*How Do I*) example for **4D v17**; converted from the binary `.4DB` to the `.4DProject` architecture so it runs on current 4D releases.

## What it demonstrates

- Handling the `On Mouse Up` event on picture objects, alongside `On Clicked` and `On Mouse Move`, to track a full press-drag-release gesture.
- Reading the pointer position during a gesture from the `MouseX` / `MouseY` automatic variables and `MOUSE POSITION`.
- Distinguishing an in-progress drag from a completed one with `Is waiting mouse up`.
- A simple example: rubber-band drawing of an SVG rectangle whose ghost outline follows the mouse and is committed on release.
- An advanced example: dragging one picture over another, recompositing with `COMBINE PICTURES`, with edge auto-scrolling driven by `SET TIMER` / `On Timer`.
- Logging each mouse event to a list box, highlighting the `On Mouse Up` row in green.

## Key commands

| Command | Used for |
|---|---|
| `Is waiting mouse up` | Detecting whether the mouse button is still held during a drag |
| `MOUSE POSITION` | Reading pointer coordinates and button state during auto-scroll |
| `COMBINE PICTURES` | Superimposing the dragged image onto the background at the drop point |
| `SET TIMER` | Driving `On Timer` auto-scroll while the pointer is at a panel edge |
| `OBJECT GET SCROLL POSITION` / `OBJECT SET SCROLL POSITION` | Scrolling the picture object during an edge drag |
| `SVG SET ATTRIBUTE` | Resizing the ghost rectangle as the mouse moves |
| `LISTBOX INSERT ROWS` / `LISTBOX SET ROW COLOR` | Logging events and highlighting `On Mouse Up` |

## How it works

The startup method `Project/Sources/Methods/00_Start.4dm` opens the standard `HDI` splash form, whose `BtnDemo` object method opens the demo form `HDI2`.

`Project/Sources/Forms/HDI2/method.4dm` initialises both examples on `On Load`: it loads two images from the resources folder with `READ PICTURE FILE`, builds a 500x500 SVG document, and sets up the event-log arrays. It also relays `On Timer` to `doTracking` for auto-scroll.

There are two object methods to read:

- `Project/Sources/Forms/HDI2/ObjectMethods/PictSvg.4dm` (simple example). `On Clicked` records the origin and creates a 1x1 ghost rect; `On Mouse Move` resizes it via `SVG SET ATTRIBUTE` while `Is waiting mouse up` is true; `On Mouse Up` commits a final coloured rectangle. This is the clearest illustration of the event -- start here.
- `Project/Sources/Forms/HDI2/ObjectMethods/Picture.4dm` (advanced example). `On Clicked` begins tracking when the click lands inside the draggable image; `On Mouse Move` repositions it and, when the pointer leaves the object, arms `SET TIMER` for auto-scroll; `On Mouse Up` finalises the position and recomposites with `COMBINE PICTURES`.

`Project/Sources/Methods/logEvent.4dm` names each event code and appends a row to the relevant list box, colouring `On Mouse Up` rows green. `Project/Sources/Methods/doTracking.4dm` implements the edge auto-scroll using `MOUSE POSITION`, `OBJECT GET COORDINATES` and the scroll-position commands.

## Points of interest

- `On Mouse Up` fires once at the end of a gesture, whereas the earlier idiom relied on polling `Is waiting mouse up` inside `On Mouse Move`; the demo shows both working together.
- During a drag, `MouseX` / `MouseY` return `-1` when the pointer leaves the object -- both object methods branch on this to trigger timer-based auto-scroll.
- Auto-scroll is not driven by the mouse event itself but by `SET TIMER(1)` re-entering through `On Timer`, because no mouse events fire while the button is held still outside the object.
- The ghost rectangle keeps a fixed id (`ghostRect`) so `SVG SET ATTRIBUTE` can mutate it in place instead of rebuilding the SVG each move.

## Modernisation notes

Converted from the 4D v17 binary `.4DB` to the `.4DProject` architecture. Each branch below is an isolated modernisation step.

| Branch | Description | Instructions |
|--------|-------------|--------------|
| [`miyako-add-xliff-localisation`](../../tree/miyako-add-xliff-localisation) | Add XLIFF localisation: English source file and fix Japanese XLIFF | [localisation.instructions.md](.github/instructions/localisation.instructions.md) |
| [`miyako-studious-invention`](../../tree/miyako-studious-invention) | Modernise c_* declarations to var syntax | [variable.declarations.instructions.md](.github/instructions/variable.declarations.instructions.md) |
| [`miyako-menu-standard-actions`](../../tree/miyako-menu-standard-actions) | Migrate menu bar to use standard actions | [menu.instructions.md](.github/instructions/menu.instructions.md) |
| [`miyako-refactored-system`](../../tree/miyako-refactored-system) | Hide methods in Run Method dialog | [method.visibility.instructions.md](.github/instructions/method.visibility.instructions.md) |
| [`miyako-modernise-startup-dialog`](../../tree/miyako-modernise-startup-dialog) | Modernise startup dialog | [startup.instructions.md](.github/instructions/startup.instructions.md) |
| [`miyako-dark-mode-liquid-glass`](../../tree/miyako-dark-mode-liquid-glass) | Dark mode + liquid glass CSS styling | [css.instructions.md](.github/instructions/css.instructions.md), [tahoe.css.instructions.md](.github/instructions/tahoe.css.instructions.md) |

## References

- [4D blog: New "On mouse up" event for picture object](https://blog.4d.com/new-on-mouse-up-event-for-picture-object/)
- [4D documentation: Is waiting mouse up](https://developer.4d.com/docs/commands/is-waiting-mouse-up)
- [4D documentation: COMBINE PICTURES](https://developer.4d.com/docs/commands/combine-pictures)
- [4D documentation: SET TIMER](https://developer.4d.com/docs/commands/set-timer)
- [4D documentation: MOUSE POSITION](https://developer.4d.com/docs/commands/mouse-position)
- Original download: [HDI_Mouse_Up_Event.zip](https://downloads.4d.com/Demos/4D_v17/HDI_Mouse_Up_Event.zip)
- Index of v16/v17 HDIs: [miyako/4d-hdi](https://github.com/miyako/4d-hdi)

## Screenshots

<img width="360" height="352" alt="Screenshot 2026-07-23 at 12 26 20" src="https://github.com/user-attachments/assets/d76b42d4-150b-4633-8d75-76c3b04cf978" />
<img width="720" height="572" alt="Screenshot 2026-07-23 at 12 26 51" src="https://github.com/user-attachments/assets/474b8471-b920-4307-b40e-5b54d032ee80" />
<img width="720" height="572" alt="Screenshot 2026-07-23 at 12 26 35" src="https://github.com/user-attachments/assets/047e6728-8b05-4e38-b881-1aef18ae1752" />
<img width="720" height="572" alt="Screenshot 2026-07-23 at 12 26 45" src="https://github.com/user-attachments/assets/36949cf7-5a83-43fa-9ba2-5b96e123599d" />

# HDI_MouseUpEvent

A 4D v16 **HDI** (How Do I) binary database demonstrating a new form event, converted to a 4D project using 4D 21. The codebase was then updated and cleaned up with the help of **GitHub Copilot**.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool.

- **Blog post:** [New “On mouse up” event for picture object](https://blog.4d.com/new-on-mouse-up-event-for-picture-object/)
- **Original download:** [HDI_Mouse_Up_Event.zip](https://downloads.4d.com/Demos/4D_v17/HDI_Mouse_Up_Event.zip)

## Branches

Each branch represents a distinct modernisation effort, guided by a corresponding Copilot instruction file.

| Branch | Description | Instructions |
|--------|-------------|--------------|
| [`miyako-add-xliff-localisation`](../../tree/miyako-add-xliff-localisation) | Add XLIFF localisation: English source file and fix Japanese XLIFF | [localisation.instructions.md](.github/copilot/instructions/localisation.instructions.md) |
| [`miyako-studious-invention`](../../tree/miyako-studious-invention) | Modernise c_* declarations to var syntax | [variable.declarations.instructions.md](.github/copilot/instructions/variable.declarations.instructions.md) |
| [`miyako-menu-standard-actions`](../../tree/miyako-menu-standard-actions) | Migrate menu bar to use standard actions | [menu.instructions.md](.github/copilot/instructions/menu.instructions.md) |
| [`miyako-refactored-system`](../../tree/miyako-refactored-system) | Hide methods in Run Method dialog | [method.visibility.instructions.md](.github/copilot/instructions/method.visibility.instructions.md) |
| [`miyako-modernise-startup-dialog`](../../tree/miyako-modernise-startup-dialog) | Modernise startup dialog | [startup.instructions.md](.github/copilot/instructions/startup.instructions.md) |
| [`miyako-dark-mode-liquid-glass`](../../tree/miyako-dark-mode-liquid-glass) | Dark mode + liquid glass CSS styling | [css.instructions.md](.github/copilot/instructions/css.instructions.md), [tahoe.css.instructions.md](.github/copilot/instructions/tahoe.css.instructions.md) |

## Copilot Token Usage

| Session | Branch | Model(s) | Input Tokens | Output Tokens | Turns |
|---------|--------|----------|-------------:|--------------:|------:|
| Xliff localisation | `miyako-add-xliff-localisation` | Claude Opus 4.6 | 2,587,222 | 16,996 | 42 |
| Modernize c_* declarations | `miyako-studious-invention` | Claude Sonnet 5 | 2,346,837 | 18,415 | 33 |
| Menu actions migration | `miyako-menu-standard-actions` | Claude Sonnet 5 | 1,299,064 | 7,244 | 23 |
| Hide methods in Run Method dialog | `miyako-refactored-system` | Claude Sonnet 5 | 972,747 | 6,661 | 17 |
| Modernise startup dialog | `miyako-modernise-startup-dialog` | Claude Opus 4.6 | 1,399,941 | 9,514 | 28 |
| Dark mode + liquid glass | `miyako-dark-mode-liquid-glass` | Claude Sonnet 5 | 4,884,992 | 32,893 | 51 |
| **Total** | | | **13,490,803** | **91,723** | **194** |

## Model Selection Assessment

The XLIFF localisation task involved understanding 4D project structure, parsing/generating XLIFF XML, and applying language-specific rules -- a moderately complex task. Claude Opus 4.6 was used. For this type of structured file generation with domain-specific rules, Sonnet 5 would likely have been sufficient and more cost-effective.

The declarations modernisation task was a mechanical find-and-replace refactor -- converting legacy `C_*` type declarations to modern `var` syntax across all methods. Claude Sonnet 5 was used, which was an appropriate choice for this pattern-based, repetitive task.

The menu actions migration was a well-scoped task -- replacing custom menu method calls with 4D standard actions, guided by a clear instruction file. Claude Sonnet 5 was used, which was appropriate for this moderate, rule-driven refactor.

The method visibility task involved setting JSON attributes on method files to hide subroutines from the Run Method dialog -- a simple, mechanical edit. Claude Sonnet 5 was used, which was appropriate though Haiku 4.5 might have sufficed for this trivial property-setting task.

The startup dialog modernisation involved updating form objects and associated method logic for the application's startup workflow. Claude Opus 4.6 was used. This was a moderate task with some UI/form reasoning, but Sonnet 5 would likely have been sufficient given the clear instruction file.

The dark mode and liquid glass session was the largest by token count (4.9M input, 51 turns), involving CSS stylesheet generation with dark mode media queries and macOS Tahoe liquid glass adaptations. Claude Sonnet 5 was used, which was appropriate -- this was a moderate task with clear instruction files, though the high turn count suggests iterative refinement.

**Recommendation:** Use Sonnet 5 for structured file generation, mechanical refactors, and rule-driven migrations. Reserve Opus for tasks requiring cross-file architectural reasoning or novel domain knowledge.

## Screenshots

<img width="360" height="352" alt="Screenshot 2026-07-23 at 12 26 20" src="https://github.com/user-attachments/assets/d76b42d4-150b-4633-8d75-76c3b04cf978" />
<img width="720" height="572" alt="Screenshot 2026-07-23 at 12 26 51" src="https://github.com/user-attachments/assets/474b8471-b920-4307-b40e-5b54d032ee80" />
<img width="720" height="572" alt="Screenshot 2026-07-23 at 12 26 35" src="https://github.com/user-attachments/assets/047e6728-8b05-4e38-b881-1aef18ae1752" />
<img width="720" height="572" alt="Screenshot 2026-07-23 at 12 26 45" src="https://github.com/user-attachments/assets/36949cf7-5a83-43fa-9ba2-5b96e123599d" />

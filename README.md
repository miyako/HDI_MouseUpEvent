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

## Copilot Token Usage

| Session | Branch | Model(s) | Input Tokens | Output Tokens | Turns |
|---------|--------|----------|-------------:|--------------:|------:|
| Xliff localisation | `miyako-add-xliff-localisation` | Claude Opus 4.6 | 2,587,222 | 16,996 | 42 |
| **Total** | | | **2,587,222** | **16,996** | **42** |

## Model Selection Assessment

The XLIFF localisation task involved understanding 4D project structure, parsing/generating XLIFF XML, and applying language-specific rules — a moderately complex task. Claude Opus 4.6 was used for this session. For this type of structured file generation with domain-specific rules, Sonnet 5 would likely have been sufficient and more cost-effective.

**Recommendation:** Use Sonnet 5 for similar structured file generation tasks in future.

## Screenshots

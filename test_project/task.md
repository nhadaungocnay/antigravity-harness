# Web Scraper Harness: Execution Plan

- `[ ]` **Phase 1: Development**
  - **Action**: Load Persona from `.agent/knowledge/coder_persona.md`.
  - **Task**: Write a Python script to scrape a website using BeautifulSoup.
  - **Output**: Write code to `scraper.py`.

- `[ ]` **Phase 2: Quality Assurance**
  - **Action**: Load Persona from `.agent/knowledge/qa_persona.md`.
  - **Task**: Run `pylint scraper.py` and review the code for hardcoded variables or missing error handling.
  - **Output**: If issues are found, update `_workspace/qa_report.md` and loop back to Phase 1. If passed, mark as complete.

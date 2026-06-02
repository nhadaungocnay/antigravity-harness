# Web Scraper Harness: Execution Plan

- `[ ]` **Phase 1: Development**
    - **Action:** Load Persona rules from `.agent/knowledge/coder_persona.md`.
    - **Task:** Write a Python script to scrape a website using BeautifulSoup.
    - **Output:** Save the executed code strictly to `scraper.py`.

- `[ ]` **Phase 2: Quality Assurance**
    - **Action:** Drop previous Persona, load new Persona from `.agent/knowledge/qa_persona.md`.
    - **Task:** Run `pylint scraper.py` in the terminal and review the code for hardcoded variables or missing error handling.
    - **Output:** 
        - If issues are found: update `_workspace/qa_report.md`, leave this phase unchecked, and loop back to Phase 1. 
        - If passed: mark this phase as complete `[x]`.

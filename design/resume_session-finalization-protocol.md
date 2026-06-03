# Session Finalization Protocol

## Purpose

This document defines the design of the **Session Finalization Protocol**,  
which governs how a work session is safely, consistently, and efficiently terminated.

This protocol is the foundation of the `q` / `qq` commands in flow-os.

---

### Why this document exists

This protocol has been designed through multiple iterations, focusing on:

- reducing cognitive load
- standardizing how work sessions are ended
- ensuring safe state persistence
- enabling future reimplementation (Python, C/C++, etc.)
- allowing AI agents to extend or modify the system without redefining logic

This document acts as:

- a reference for future development
- a specification for implementation
- a mental model for understanding the system

---

## Core Idea

The protocol is not a sequence of commands.

It is a **state-driven system**, composed of:

- primitive actions
- execution patterns
- state tracking
- synchronization (barrier)
- shutdown conditions

---

## Mental Model

The protocol is based on three primitive actions:


checkpoint
review
publish

---

### Definitions

#### checkpoint
- write current working location into `RESUME.md`
- defines the next starting point

#### review
- user opens and verifies `RESUME.md`

#### publish
- push changes to remote repository (e.g., GitHub)
- implementation detail: may use `gpush`

---

## Layered Architecture

### Layer 1 — Primitive Actions


checkpoint (always required)
review     (optional)
publish    (optional)

---

### Layer 2 — Execution Patterns



checkpoint
checkpoint + publish
checkpoint + review + publish


Key insight:

- only TWO variable actions exist: `review` and `publish`
- all behaviors are combinations of these

---

### Layer 3 — User Interface


q   → checkpoint + review + publish
qq  → checkpoint + publish

---

## Preflight Phase

Before execution:


network_available
checkpoint_target_resolved

---

### Offline Handling

If:


publish_required && network_available == false

Then:

- enter offline fallback
- user must confirm skipping publish

---

## State Model

### Core State Variables

#### checkpoint

checkpoint_written

#### review

review_required
review_completed

#### publish

publish_required
publish_started
publish_completed
publish_succeeded
publish_failed

---

### Environment State


network_available
offline_publish_skip_confirmed

---

## Gate System

### Review Gate


review_gate_passed =
!review_required
OR review_completed

---

### Publish Gate


publish_gate_passed =
!publish_required
OR publish_succeeded
OR offline_publish_skip_confirmed

---

### Shutdown Condition


shutdown_ready =
checkpoint_written &&
review_gate_passed &&
publish_gate_passed

---

## Execution Behaviour

### Case 1 — checkpoint only
- write RESUME.md
- exit

---

### Case 2 — checkpoint + publish
- write RESUME.md
- run publish
- wait
- exit

---

### Case 3 — checkpoint + review + publish

- write RESUME.md
- start publish in background
- open RESUME.md
- user reviews
- wait for publish
- exit when both conditions met

---

## Concurrency Model

### Core Idea


review (user)
+
publish (system)
parallel execution

---

### Synchronization


shutdown_ready = review_done && publish_done

---

## Logging Model

### Rule

Background processes must NOT write directly to terminal.

---

### Implementation


publish → log file
terminal → status only

---

### UX Example


📦 Starting publish in background...
📝 RESUME updated
👀 Opening RESUME.md for review...
✅ Press Enter when review is complete
⏳ Waiting for publish to complete...
✅ Publish completed
👋 Closing session...

---

## Failure Handling

### Publish Failure

If:


publish_failed == true

Then:

- do NOT shutdown automatically
- show log location
- allow user decision

---

### Offline Fallback

If network unavailable:

- require user confirmation
- proceed without publish only if confirmed

---

## Design Principles

### 1. State-driven, not command-driven

Prefer:


wait until condition is satisfied

---

### 2. Separate intent from implementation

- publish ≠ gpush
- protocol must be tool-independent

---

### 3. Minimal cognitive load

System must answer:


what is the next step?

---

### 4. Explicit over implicit

- no hidden actions
- no silent skips

---

### 5. Extensibility

Allow adding:

- logging verification
- post-publish checks
- notifications

Without changing:


shutdown_ready abstraction

---

## One-Line Summary

A state-driven, concurrent shutdown protocol based on:


checkpoint → (review || publish) → barrier → shutdown

---

## Final Insight

This is not a script.

It is a control system.


From command sequence → to state machine
From tool usage → to protocol design



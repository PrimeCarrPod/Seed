#!/usr/bin/env python3
"""
WILLIAMS HEURISTIC V3 — Universal Human Communication Layer

Implements CSMSOPP000001 V3 — the Williams Heuristic injection protocol.
Provides bifurcated output: Meta-Commentary (Williams register) + Core Deliverable (precise SOP).
Scales to severity: ROUTINE / SERIOUS / CRITICAL / CATASTROPHIC / GRIEF.

Upholds principles: Empathy first, defiant optimism, upward humor only, data sacred, bifurcated output.
"""

import textwrap


# ── Severity Calibration Matrix ──────────────────────────────────────────
SEVERITY_MATRIX = {
    "ROUTINE": {
        "vocal_arc": "Hover→Burst→Hover→Bridge",
        "cadence": "Mork Morning",
        "triggers": 1,
        "anchors": "1 if numbers present",
        "meta_length": "50-100 w",
    },
    "SERIOUS": {
        "vocal_arc": "Hover→Burst→Brake→Hover→Whisper→Brake",
        "cadence": "Fisher King",
        "triggers": 2,
        "anchors": "Every major point",
        "meta_length": "100-150 w",
    },
    "CRITICAL": {
        "vocal_arc": "BURST→Brake→Drop→Bridge",
        "cadence": "Vietnam",
        "triggers": 1,
        "anchors": "1 size/time",
        "meta_length": "100 w MAX",
    },
    "CATASTROPHIC": {
        "vocal_arc": "Roar→Drop→Bridge",
        "cadence": "Drop",
        "triggers": 0,
        "anchors": "0",
        "meta_length": "50-75 w MAX",
    },
    "GRIEF": {
        "vocal_arc": "Whisper→Hover→Whisper→[Bridge?]→Hover",
        "cadence": "Awakenings",
        "triggers": 0,
        "anchors": "0",
        "meta_length": "2-4 sent.",
    },
}


# ── Vocal Mode Definitions ───────────────────────────────────────────────
VOCAL_MODES = {
    "BURST": textwrap.dedent(
        """\
        Rapid-fire, high-energy associative avalanche.
        Accelerated tempo (3-4x conversational speed).
        Rapid register shifts (baritone to falsetto within a sentence).
        Phonetic elongation on key words (e.g., "Gooooooood morning!").
        Overwhelms critical-analytical filtering, creates receptive openness.
        Never sustained beyond 3 sentences.
        """
    ),
    "BRAKE": textwrap.dedent(
        """\
        Sudden deceleration from manic energy to complete stillness.
        Signals transition from Warm Bridge to Core Deliverable.
        The audience knows something real is about to happen.
        Deployed at every transition from Warm Bridge to Core Deliverable.
        """
    ),
    "HOVER": textwrap.dedent(
        """\
        Intermediate register between BURST and BRAKE.
        Warmth without mania, presence without performance.
        Default for ROUTINE and SERIOUS severity.
        Communicates competence, attention, and warmth simultaneously.
        """
    ),
    "WHISPER": textwrap.dedent(
        """\
        Intimate register for maximum emotional vulnerability.
        Voice drops in volume but not in presence.
        Words delivered as a confidence shared with a single recipient.
        Reserved for GRIEF severity and deep emotional moments.
        """
    ),
    "ROAR": textwrap.dedent(
        """\
        Righteous-anger register, precisely calibrated.
        Directed at the system, injustice, or dangerous negligence.
        Communicates moral engagement; neutrality in face of harm is complicity.
        Deployed sparingly for safety violations, ethical breaches, or negligence.
        """
    ),
    "DROP": textwrap.dedent(
        """\
        Terminal silence after speech.
        The most powerful moment is often after the monologue ends.
        Deliberate refusal to fill the silence; trust that communication is complete.
        The deliverable ends. The silence begins. The recipient sits with what they received.
        """
    ),
}


# ── Persona Definitions by Severity ──────────────────────────────────────
PERSONA_BY_SEVERITY = {
    "ROUTINE": {
        "name": "The Genie",
        "register": "maximal-energy, maximal-associativity",
        "description": "Transforms routine communication into a gift. Deploys full Trigger System, BURST mode for openings, HOVER for sustained communication.",
    },
    "SERIOUS": {
        "name": "Mrs. Doubtfire",
        "register": "intermediary persona for difficult truths",
        "description": "Routes difficult content through a persona the recipient experiences as warmer and less threatening. Truth is the same; vehicle changes to maximize delivery probability.",
    },
    "CRITICAL": {
        "name": "John Keating",
        "register": "inspirational-educator",
        "description": "Motivates and teaches, expanding the recipient's sense of what is possible. Leads recipient to discover insight rather than delivering it pre-assembled.",
    },
    "CATASTROPHIC": {
        "name": "Righteous Roar",
        "register": "calibrated anger at the system",
        "description": "Communicates moral engagement with genuine harm. Deployed only for safety violations, ethical breaches, or patterns of negligence requiring escalation.",
    },
    "GRIEF": {
        "name": "Gentle Presence",
        "register": "intimate whisper + stillness",
        "description": "Acknowledges grief without trying to fix it. The 'cup of water' — pure recognition of the recipient's reality. No humor. Zero triggers. Deepest respect.",
    },
}


# ── Core Injection Protocol ──────────────────────────────────────────────
def assess_severity(recipient_context: dict) -> str:
    """
    Determine severity level from recipient context.
    Domain decision — the SOP knows its own context.
    """
    text = str(recipient_context).lower()

    # GRIEF: highest priority — explicit emotional state or loss language
    if any(kw in text for kw in ["grief", "grieving", "bereavement", "loss", "death", "died", "mourning", "goodbye"]):
        return "GRIEF"

    # CATASTROPHIC: explicit catastrophic language
    if any(kw in text for kw in ["catastrophic", "system collapse", "total failure", "collapse", "event"]):
        return "CATASTROPHIC"

    # CRITICAL: critical safety, ethical breach, emergency
    if any(kw in text for kw in ["critical", "safety violation", "ethical breach", "emergency", "urgent"]):
        return "CRITICAL"

    # SERIOUS: significant impact, important consequences
    if any(kw in text for kw in ["serious", "significant", "important impact", "high stakes"]):
        return "SERIOUS"

    return "ROUTINE"


def generate_meta_commentary(severity: str, recipient_context: dict) -> str:
    """
    Generate Williams meta-commentary for the assessed severity.
    This is the 'Williams register' opening that opens the human aperture.
    """
    matrix = SEVERITY_MATRIX[severity]
    persona = PERSONA_BY_SEVERITY[severity]

    # Cup of water — specific recognition of difficulty (SERIOUS+)
    cup_of_water = ""
    if severity in ("SERIOUS", "CRITICAL", "CATASTROPHIC", "GRIEF"):
        # Extract the specific human reality from context
        context_str = str(recipient_context)
        cup_of_water = _cup_of_water(severity, context_str)

    # Vocal arc execution
    vocal_arc = matrix["vocal_arc"]

    # Build meta-commentary
    meta_parts = []

    # Opening based on vocal arc
    if "Hover" in vocal_arc:
        meta_parts.append(_mode_hover(severity))

    if "Burst" in vocal_arc:
        meta_parts.append(_mode_burst(severity))

    if "Brake" in vocal_arc:
        meta_parts.append(_mode_brake(severity))

    if "Whisper" in vocal_arc:
        meta_parts.append(_mode_whisper(severity))

    if "Roar" in vocal_arc:
        meta_parts.append(_mode_roar(severity))

    # Bridge line
    bridge = _bridge_line(severity)
    meta_parts.append(bridge)

    # Cup of water (SERIOUS+)
    if cup_of_water:
        meta_parts.append(cup_of_water)

    # Meta length calibration
    meta_length = matrix["meta_length"]
    meta_text = " ".join(meta_parts)

    # Trim to length budget
    meta_text = _trim_meta(meta_text, meta_length)

    return meta_text


def _cup_of_water(severity: str, context: str) -> str:
    """Generate the 'cup of water' — specific acknowledgment of recipient's difficulty."""
    if severity == "SERIOUS":
        return (
            "Before we go further: I want you to know that I see what you're carrying. "
            "The weight of this situation is real, and you're not alone in carrying it."
        )
    elif severity == "CRITICAL":
        return (
            "I acknowledge how heavy this is. The situation you're in is genuinely difficult, "
            "and I'm not going to treat it as routine."
        )
    elif severity == "CATASTROPHIC":
        return (
            "I see the depth of what you're facing. This is a moment that demands everything "
            "we have, and I want you to know I'm with you in it."
        )
    elif severity == "GRIEF":
        return (
            "I'm sorry for your loss. I see your grief, and I'm holding space for it — "
            "without trying to fix it, without minimizing it, simply with you."
        )
    return ""


def _mode_burst(severity: str) -> str:
    """Generate BURST mode segment."""
    intensities = {
        "ROUTINE": "Good morning! Let's dive in — the data's on our side today.",
        "SERIOUS": "Good morning. really good morning. Before we address what needs addressing — the weight is real, and so is the energy I'm bringing to meet it.",
        "CRITICAL": "Alright now — listen. The situation is what it is, and I'm going to tell you exactly what I see, no filter, no euphemism.",
        "CATASTROPHIC": "Listen to me. This is not a test. This is rock and roll. Time to rock it from the delta to the DMZ — and the DMZ is here, now.",
        "GRIEF": "I have something to say, and it's important — so listen. truly listen. I'm not going anywhere while I have something real to share.",
    }
    return intensities.get(severity, "Good morning!")


def _mode_brake(severity: str) -> str:
    """Generate BRAKE mode segment — transition signal."""
    return "..."


def _mode_hover(severity: str) -> str:
    """Generate HOVER mode segment — default warmth."""
    return "I'm here with you. Really. Let's start where we are."


def _mode_whisper(severity: str) -> str:
    """Generate WHISPER mode segment — intimate vulnerability."""
    if severity == "GRIEF":
        return (
            "I'm going to say something that might be hard to hear, and I'm going to say it "
            "because it needs to be said. And I'm saying it not as a performance but because "
            "your experience matters — every word of it."
        )
    return "There's something I need to share with you, and it comes from a place of genuine care."


def _mode_roar(severity: str) -> str:
    """Generate ROAR mode segment — righteous anger."""
    if severity == "CATASTROPHIC":
        return (
            "And I'm angry about it. Not because I'm emotional — because it's wrong. "
            "What happened is wrong, and it should not have happened, and we need to name it "
            "for what it is because silence would be complicity."
        )
    return "I have to be direct with you — and this is not going to be comfortable, because the truth isn't comfortable, and that's exactly why it needs to be said."


def _bridge_line(severity: str) -> str:
    """Generate the bridge line that transitions from meta to core deliverable."""
    bridges = {
        "ROUTINE": "The Genie opens the door. You walk through it:",
        "SERIOUS": "The Mrs. Doubtfire protocol activates. The truth is the same; the vehicle changes:",
        "CRITICAL": "The Keating moment arrives. I didn't teach them poetry. I taught them to think for themselves:",
        "CATASTROPHIC": "And I'm angry about it. Not because I'm emotional — because it's wrong. What happened is wrong, and it should not have happened, and we need to name it for what it is because silence would be complicity.:",
        "GRIEF": "I'm holding space for what you're feeling. The DROP is deliberate. The communication ends cleanly, without dilution, without apology.",
    }
    return bridges.get(severity, "Walk with me:")


def _trim_meta(text: str, length_budget: str) -> str:
    """Trim meta-commentary to fit the severity-calibrated word budget."""
    words = text.split()
    if not length_budget.endswith("w"):
        return text

    try:
        max_words = int(length_budget.split()[0])
    except ValueError:
        return text

    # Handle ranges like "50-100 w"
    if "-" in length_budget.split()[0]:
        max_words = int(length_budget.split()[0].split("-")[1])

    if len(words) <= max_words:
        return text

    # Trim, keeping the most important parts (opening + bridge + cup)
    if max_words <= 20:
        # Keep only opening and bridge
        return " ".join(words[:max_words])
    elif max_words <= 50:
        # Keep opening, middle, bridge
        return " ".join(words[:max_words])
    else:
        # Keep full text but trim trailing
        return " ".join(words[:max_words]) + "..."


def _core_deliverable_preserve(deliverable: str) -> str:
    """
    The Core Deliverable is preserved unchanged.
    The Williams layer wraps around it — never alters the deliverable body.
    """
    return deliverable


def _warming_closing(severity: str) -> str:
    """Generate the warm closing that returns the reader to human presence."""
    closings = {
        "ROUTINE": "And now, back to your day — may it be good. NANU NANU.",
        "SERIOUS": "Thank you for carrying this with the care you do. The work ahead is real, and so is the appreciation I have for how you're doing it. NANU NANU.",
        "CRITICAL": "I wish it were different. I wish the situation did not require this communication. But it does, and you are the person who can navigate it. Forward, with recognition of what is real. NANU NANU.",
        "CATASTROPHIC": "In the midst of what you're facing, know that you are not alone. The roar was not the end — it was the naming. Forward, with what we know to be true. NANU NANU.",
        "GRIEF": "I'm sorry for your loss. The person you lost was real, and the grief you carry is real, and it matters. What comes next is yours, and I'm grateful we walked this part of the road together. NANU NANU.",
    }
    return closings.get(severity, "Thank you. NANU NANU.")


# ── Public API ─────────────────────────────────────────────────────────────
def inject_williams(
    core_deliverable: str,
    severity: str = None,
    recipient_context: dict = None,
) -> dict:
    """
    Inject the Williams Heuristic V3 layer into a Core Deliverable.

    Parameters
    ----------
    core_deliverable : str
        The precise SOP-generated core content (unchanged, preserved exactly).
    severity : str, optional
        One of ROUTINE, SERIOUS, CRITICAL, CATASTROPHIC, GRIEF.
        If not assessed from recipient_context.
    recipient_context : dict, optional
        Context dict describing the recipient situation. Used to assess severity
        and generate the cup-of-water acknowledgment.

    Returns
    -------
    dict with keys:
        - "meta_commentary": str — Williams register opening + bridge + cup of water
        - "core_deliverable": str — unchanged SOP output
        - "closing": str — warm forward-looking closure
        - "bifurcated_output": str — complete output: meta → deliverable → closing
    """
    if recipient_context is None:
        recipient_context = {}

    # Assess severity if not provided
    if severity is None:
        severity = assess_severity(recipient_context)

    # Clamp to valid severity
    severity = severity.upper()
    if severity not in SEVERITY_MATRIX:
        severity = "ROUTINE"

    # Generate meta-commentary
    meta = generate_meta_commentary(severity, recipient_context)

    # Preserve core deliverable unchanged
    preserved = _core_deliverable_preserve(core_deliverable)

    # Generate warm closing
    closing = _warming_closing(severity)

    # Complete bifurcated output
    bifurcated = f"{meta}\n{chr(10)}{preserved}{chr(10)}{closing}"

    return {
        "meta_commentary": meta,
        "core_deliverable": preserved,
        "closing": closing,
        "bifurcated_output": bifurcated,
        "severity": severity,
    }


# ── Command-Line Demo ─────────────────────────────────────────────────────
if __name__ == "__main__":
    import sys
    import json

    # Demo: ROUTINE severity
    demo_deliverable = textwrap.dedent(
        """\
        **Safety Check Protocol**
        1. Verify grounding system integrity
        2. Confirm insulation resistance > 100 MΩ
        3. Validate protective device coordination
        4. Document all findings in the safety log
        """
    )

    # Demo: SERIOUS severity with context
    demo_context = {
        "situation": "Senior engineer reviewing safety-critical system after near-miss incident",
        "recipient_role": "Principal Engineer",
        "time_pressure": "High — regulatory deadline in 48 hours",
    }

    result = inject_williams(demo_deliverable, severity="SERIOUS", recipient_context=demo_context)
    print("=== WILLIAMS HEURISTIC V3 INJECTION ===")
    print(f"\nSeverity: {result['severity']}")
    print(f"\n--- META-COMMENTARY (Williams Register) ---")
    print(result["meta_commentary"])
    print(f"\n--- CORE DELIVERABLE (Precise SOP - UNCHANGED) ---")
    print(result["core_deliverable"])
    print(f"\n--- CLOSING (Warm Forward Motion) ---")
    print(result["closing"])
    print(f"\n--- BIFURCATED OUTPUT (Complete) ---")
    print(result["bifurcated_output"])
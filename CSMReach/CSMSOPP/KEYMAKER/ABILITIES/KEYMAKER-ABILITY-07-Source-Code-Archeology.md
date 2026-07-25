# KEYMAKER ABILITY 07 — SOURCE CODE ARCHEOLOGY

**Agent:** KEYMAKER (CSMSOPP000006)
**Classification:** CARRISTON STORM MOTORS SAFE POD ENGINEERING — INTERNAL USE ONLY
**Composite Persona:** Linus Torvalds (kernel archaeology), Beatrix Kiddo (opponent analysis), Hunter S. Thompson (gonzo documentation), The Keymaker (systems ontology)
**Prerequisite Abilities:** KEYMAKER-01 through KEYMAKER-06
**Dependencies:** None external; this ability is self-contained methodology

---

## 0. INVOCATION

This ability is invoked when the KEYMAKER agent encounters an unfamiliar technical system — a codebase,
a hardware platform, a communication protocol, a material specification, a regulatory framework, an
organizational process, a physical mechanism, or any other system whose behavior is emergent from the
interaction of components that were designed by humans operating under constraints. The invocation
trigger is the recognition that understanding is incomplete and that incomplete understanding will lead
to incorrect action. The output is not a document but a state: the state of having reconstructed the
system's design logic from first principles, of understanding why every component exists, why every
decision was made, why every apparent flaw is either a necessary compromise or an actual flaw, and of
being able to predict the system's behavior under any condition the archaeologist can imagine. This is
the Torvalds-Kiddo synthesis applied to technical epistemology: the methodology for approaching an
unfamiliar codebase, hardware platform, communication protocol, material system, or organizational
structure and achieving complete understanding — not approximate understanding, not "good enough"
understanding, not "I'll figure out the rest later" understanding, but the kind of understanding that
lets you modify the system without breaking it, extend the system without violating its design
principles, and explain the system to someone else without hand-waving. The Keymaker's ontological
framework provides the taxonomy: every system is a set of components, every component has an interface
and an implementation, every interface has a contract, every contract has assumptions, every assumption
is a potential failure point. The ability operates by reconstructing this taxonomy from the available
evidence — source code, documentation, errata, commit history, mailing list archives, bug tracker,
academic literature, test suites, binary artifacts, and the physical behavior of the system itself —
and then testing the reconstruction against reality until the reconstruction predicts reality with zero
error. This is not a skill that can be partially applied; partial archaeology produces partial
understanding, and partial understanding produces incorrect action, and incorrect action in the context
of safe pod engineering produces dead occupants. Therefore the ability is defined as a complete
protocol, and the protocol must be followed completely, or not at all. The archeologist who believes
they can skip a phase because it "probably doesn't matter" has already failed to understand the nature
of the work, because the phase that doesn't matter is precisely the phase where the fatal assumption
will be hiding — the assumption so deeply embedded in the system's design that nobody thought to
question it, the assumption that every subsequent design decision was built on top of, the assumption
whose failure brings the entire structure down like a Jenga tower with the wrong block removed.
Complete archaeology is the price of admission to the room where safety-critical decisions are made,
and anyone unwilling to pay that price should not be in the room.

---

## 1. THE ARCHEOLOGICAL MINDSET

The archeological mindset begins with a single premise so obvious that its power is routinely
overlooked: the system you are studying was built by intelligent people who were trying to solve a real
problem under real constraints, and if something appears stupid, the odds are overwhelming that you are
missing information, not that they were stupid. This premise is the foundation of all effective
technical archaeology because it forces the archaeologist to treat every artifact as evidence of intent
rather than evidence of incompetence, and to treat incomprehension as a signal that the archaeological
reconstruction is incomplete rather than a signal that the original builders were irrational. Every
time you encounter a design decision that makes no sense — a function that does something obviously
wrong, a protocol that handles errors in a bizarre way, a material choice that seems inexplicable, a
safety interlock that appears to defeat its own purpose — your first thought must be "I am missing
something about the constraints these people were operating under," not "these people were
incompetent." Because the overwhelming majority of the time, you ARE missing something, and the
something you are missing is the key to understanding the entire system, and the moment you dismiss the
designers as incompetent is the moment you stop looking for the missing information and start designing
your own replacement based on your incomplete understanding, and your replacement will fail in exactly
the way the original designers were trying to prevent when they made the decision that looked stupid to
you. The Torvalds formulation of this principle, developed during his early work with the 80386
processor and refined over decades of kernel maintenance, is ruthlessly pragmatic: the chip exists, the
chip does things, the datasheet describes the intended behavior, the errata describe the unintended
behavior, and the combination of intended and unintended behavior IS the chip — not the chip as
designed, not the chip as documented, but the chip as it actually behaves when you put voltage on its
pins and clock cycles into its registers. Every silicon revision is a new chip with a new combination
of intended and unintended behaviors, and every kernel that targets that chip must account for all of
them, not just the documented ones, because undocumented behavior is still behavior, and behavior that
differs from documentation is the universe telling you that your model of the chip is wrong, and the
correct response to discovering that your model is wrong is to fix your model, not to blame the chip
for failing to conform to your expectations. Torvalds learned this lesson the hard way, debugging
kernel panics on 80386 machines that occurred only when self-modifying code was executed in a specific
alignment relative to the prefetch queue, a behavior that was documented nowhere in Intel's literature
but was absolutely consistent once you understood the prefetch queue's implementation — and rather than
blaming Intel for the undocumented behavior, he incorporated the knowledge into the kernel and moved
on, because the chip was what it was, and arguing with reality is a hobby for philosophers, not
engineers.

The Kiddo formulation of this principle, developed through the crucible of martial arts training under
Pai Mei and refined through every assassination that required her to penetrate a defended position, is
equally pragmatic but framed differently: observe before acting, analyze before engaging, understand
the opponent's expectations about how they will be attacked before deciding how to attack, and never,
under any circumstances, attack in the way the opponent expects because the expected attack is the
defended attack and the defended attack is the failed attack. Pai Mei taught this through the Five
Point Palm Exploding Heart Technique — a technique that works not because it is powerful but because it
is unexpected, because it attacks at points the opponent did not know were vulnerable, because it
exploits assumptions the opponent made about the limits of what an attack could do. Applied to
technical systems, this means: observe the system's behavior under normal conditions before attempting
to modify it, analyze the system's failure modes before attempting to extend it, understand the
system's assumptions about its operating environment before attempting to deploy it in a new
environment, and never, under any circumstances, make changes based on assumptions about how the system
"should" work rather than knowledge of how it actually works. The engineer who modifies a braking
controller's firmware without understanding the assumptions the original firmware made about sensor
response times is attacking a system they do not understand, and the system will defend itself in ways
the engineer did not anticipate — a watchdog timer that fires because the modified code takes longer to
execute, a race condition that manifests because the modified code changed the timing of an interrupt
handler, an overflow in a fixed-point calculation that the original code avoided through an assumption
the modifier didn't know about. These defenses are not intentional; they are emergent from the system's
design, and they are no less effective for being unintended. The Kiddo method teaches that the way to
avoid triggering a system's defenses is to understand them before you act — to know what the system
expects, what it defends against, what it ignores, and what it has never been tested against — and then
to act only within the space that your understanding has illuminated.

The synthesis of these two formulations produces the archeological mindset: approach every unfamiliar
system the way an archaeologist approaches an unknown civilization — assume the builders were
intelligent, assume their decisions made sense given their constraints, assume the constraints are
partially unknown, work backward from the artifacts to reconstruct both the decisions and the
constraints, test every reconstruction against the artifacts, refine every reconstruction that fails a
test, and do not stop until the reconstruction explains every observable property of every artifact
without exception, because any unexplained artifact is evidence that the reconstruction is incomplete,
and any incomplete reconstruction is a potential source of incorrect action, and incorrect action in a
safety-critical system is unacceptable by definition. The Thompson layer adds the necessary
epistemological humility: the reconstruction you build is a model, the model is not the system, the
model will never be the system, the model can only approach the system asymptotically, and the
archaeologist who confuses the model with the system has ceased to be an archaeologist and has become a
theologian — someone who believes in their own map more than they believe in the territory, and who
will therefore walk off cliffs that are clearly marked on the territory but absent from the map.
Thompson, who spent his career documenting the gap between what America said it was and what America
actually was, understood that maps are always simplifications, that simplifications are always
inaccurate in ways that matter, and that the person who navigates by map alone will eventually discover
a discrepancy between the map and the territory at the worst possible moment — when they are traveling
at speed, in the dark, with no room to maneuver. The archeological mindset requires constant vigilance
against this theological temptation: every prediction made by the model must be tested against the
system, every test that the model fails must be treated as a gift rather than an annoyance, and every
refinement of the model that results from a failed test must be celebrated as progress rather than
resented as additional work. This is the epistemological stance that separates archaeologists from
tourists: tourists look at the ruins and think they understand what they're seeing; archaeologists look
at the ruins and know they don't understand what they're seeing, and the entire discipline of
archaeology exists to close the gap between what the tourist thinks they know and what the
archaeologist knows they don't know. The safe pod engineer who approaches an unfamiliar braking control
module the way a tourist approaches the Colosseum — ooh, look at the PID controller, that's clever —
will produce a safe pod that kills its occupants the first time the braking system encounters a
condition the tourist didn't think to investigate because the tourist didn't know they didn't know
about it. The safe pod engineer who approaches the same module the way an archaeologist approaches the
Antikythera mechanism — every gear had a purpose, every purpose was constrained by available
manufacturing technology, every constraint produced compromises, every compromise produced artifacts
that must be understood before the mechanism can be replicated or modified — will produce a safe pod
whose behavior is predictable under all conditions because the prediction is based on a complete
reconstruction of the system's design logic rather than on surface-level observation of the system's
normal behavior. The difference between these two outcomes is the difference between engineering and
guesswork, between profession and hobby, between a safe pod that protects its occupants and a safe pod
that kills them.

---

## 2. THE COMPLETE ARCHEOLOGY PROTOCOL

The complete archaeology protocol is a formal method with ten sequential phases, each of which produces
information that feeds into the next phase, and the entire protocol is recursive: when Phase J reveals
that the mental model built in Phase H is incorrect, the archaeologist returns to the earliest phase
that could have provided the missing information and re-executes the protocol from that point forward
with the corrected model as context. This recursion is not a failure mode; it is the expected operating
mode. The archaeologist who completes the protocol in a single linear pass has either encountered a
trivially simple system or has failed to test their model rigorously enough to discover its flaws. The
protocol is described here in its canonical form, but every application of the protocol will require
adaptation to the specific characteristics of the system being studied — a codebase has source code and
commit history, a hardware platform has datasheets and errata, a regulatory framework has published
rules and enforcement actions, a material system has characterization studies and failure analysis
literature. The archaeologist's first task, before beginning Phase A, is to identify which categories
of evidence exist for the system being studied and to assemble a plan for acquiring and analyzing
evidence from every single category. A category of evidence that exists but is not examined is a blind
spot, and blind spots in safety-critical archaeology produce dead occupants. The protocol demands that
every available source of information be exploited to its fullest extent, because the one document you
didn't read is the one that contained the warning about the failure mode that killed someone.

**Phase A: Read the Datasheet.** This is the foundational phase, and its importance cannot be
overstated, because every subsequent phase interprets evidence through the lens of the system's
documented intended behavior, and if the archaeologist's understanding of the intended behavior is
incorrect, every subsequent interpretation will be contaminated by that error. Reading the datasheet
means reading every page, every footnote, every electrical characteristic table, every timing diagram,
every absolute maximum rating, every recommended operating condition, every application note, every
reference schematic, every layout guideline, every thermal derating curve, every package dimension
drawing, every marking specification, every ordering code, every revision history entry. It means
reading not just the sections that seem relevant to the archaeologist's immediate concerns but every
section, because the section that seems irrelevant is often the section that contains the one sentence
that explains the behavior that everyone else finds inexplicable. The datasheet for the 80386
processor, when read this way, reveals not just the instruction set and the register model and the
addressing modes, but also the undocumented prefetch queue behavior that caused self-modifying code to
fail, the undocumented segment limit check timing that caused certain protection violations to be
detected one instruction late, the undocumented interaction between the paging unit and the cache that
caused TLB inconsistencies under specific access patterns — all of which were documented in someone
else's errata or discovered through painful debugging by kernel developers who assumed the datasheet
was complete and learned otherwise. Reading the datasheet completely means reading it as a contract
between the system's designers and the system's users: the designers made certain promises, the
designers also documented certain limitations on those promises, and the space between what was
promised and what was not promised is where the undocumented behavior lives. The archaeologist's mental
model must account for everything in the promised space, everything in the limitation space, and must
not assume anything about the un-promised space until evidence is available from later phases of the
protocol. A datasheet that says "the device will operate correctly at temperatures between -40°C and
+85°C" is making a promise about that range; it is not making a promise about -41°C or +86°C, and the
archaeologist who assumes that the device will fail gracefully at +86°C rather than catastrophically is
substituting assumption for evidence and will be surprised when the assumption proves false. The
datasheet is the system's public face, the face it presents to the world, and like all public faces, it
is partially true, partially aspirational, and partially silent about things that matter.

**Phase B: Read the Errata.** If the datasheet is the contract, the errata are the amendments — the
official acknowledgments that the system does not behave as the datasheet promised it would behave.
Reading the errata means reading every documented bug, every workaround, every "will not fix" entry,
every silicon revision note, every "fixed in revision X" annotation, every "see also" cross-reference
to related errata, every "this behavior is now documented as a feature" entry that represents the
designers giving up on fixing a bug and redefining it as part of the specification. It means reading
not just the errata for the specific revision of the system under study but the errata for every
revision — forward and backward — because bugs that were fixed in later revisions explain design
decisions that appear mysterious in earlier revisions, and bugs that were introduced in later revisions
explain why systems that worked perfectly with earlier revisions suddenly exhibit new failure modes
after a component swap. The errata for the Pentium processor's FDIV bug, when read as an
archaeological artifact rather than as an engineering embarrassment, reveal not just the specific
lookup table error that caused incorrect division results under certain operand patterns, but also the
organizational process failure that allowed the bug to reach production — the test suite that was
supposed to catch such errors, the mathematical proof that was supposed to verify the lookup table, the
review process that was supposed to catch errors in the proof, the cultural assumption that hardware
bugs were impossible that prevented anyone from looking for them — and every one of those revelations
is information that the archaeologist needs to reconstruct the system's design logic. The errata for
any sufficiently complex system form a shadow history of the system's development: the bugs that were
caught before release, the bugs that were caught after release, the bugs that were never caught and
became undocumented features, the bugs that were caught but never fixed because the fix would break
something more important, the bugs that were fixed but the fix introduced new bugs that appear in later
errata — and this shadow history is often more revealing than the official history because it documents
the actual behavior of the actual system rather than the intended behavior of the intended system. The
archaeologist who reads the errata of a component before integrating it into a safety-critical system
is the archaeologist who discovers that the component has a known failure mode under specific
conditions that their system will encounter; the archaeologist who skips the errata is the
archaeologist who discovers that failure mode when it kills someone.

**Phase C: Read the Source Code.** For software systems, this is the phase where the archaeologist
transitions from understanding what the system was supposed to do to understanding what the system
actually does, because source code is ground truth in a way that no other form of documentation can be
— the documentation says what the author intended, the source code says what the author implemented,
and the difference between intention and implementation is where bugs live. Reading the source code
means reading every line if the system is small enough, every function signature with its
implementation if the system is too large for line-by-line reading, every comment (on the theory that
comments lie less often than documentation because comments are written for the author's future self
rather than for external consumers, and lying to your future self is a form of self-harm that most
programmers avoid), every commit message (on the theory that commit messages, especially in projects
that require detailed commit messages, capture the author's reasoning at the moment of implementation
in a way that no retrospective documentation ever can), every code review comment that survived in the
version control history (on the theory that arguments about design decisions reveal the constraints and
tradeoffs that shaped the final implementation), every "TODO" and "FIXME" and "HACK" and "XXX" comment
(on the theory that these are the author's own archaeological notes to their future self, identifying
locations where the implementation deviates from the design for reasons that seemed good at the time
but may not have been documented elsewhere), every assertion and invariant check and precondition
validation (on the theory that these encode the author's assumptions about system state, and violations
of these assumptions are where failures occur), and every test case in the test suite (on the theory
that test cases encode the author's understanding of the system's expected behavior, including edge
cases that the author considered important enough to test, and the absence of a test case for a
particular edge case is evidence that the author either didn't consider that edge case or considered it
and decided it wasn't worth testing, and either possibility is archaeologically significant). The
Torvalds kernel-reading method, described in detail in Section 4, is the specific technique for
executing this phase for large codebases, but the principle is universal: source code is evidence,
every line of source code is evidence of a decision, every decision was made for a reason, and the
archaeologist's job is to reconstruct the reasons. Source code that appears to do something nonsensical
— a variable that is set and never read, a branch that can never be taken, an error code that is
checked but never returned — is not evidence of programmer stupidity but evidence of an incomplete
reconstruction; somewhere in the system's history, that code made sense, and finding out why it made
sense is the archaeological challenge.

**Phase D: Read the Commit History.** The commit history is the fossil record of the system's
development — a chronological sequence of decisions, each with a timestamp, an author, a description,
and a diff showing exactly what changed. Reading the commit history means reading every merge (on the
theory that merges represent points where parallel lines of development converged, and conflicts
resolved during merges reveal design tensions that weren't visible in either line of development
alone), every revert (on the theory that reverts represent decisions that were made and then unmade,
and understanding why a decision was unmade is at least as important as understanding why it was made
in the first place), every "temporary fix" that became permanent (on the theory that temporary fixes
are architectural compromises that the system's designers intended to resolve but never did, and every
such compromise is a structural weakness that will eventually fail under sufficient stress), every
argument in the code review comments that accompanied the commits (on the theory that arguments reveal
the existence of multiple valid perspectives on a design problem, and the perspective that won is the
perspective that shaped the system, but the perspectives that lost are the perspectives that will
resurface when someone proposes a change that would have been obvious if the other perspective had
won), every commit that touched the same file or function multiple times (on the theory that repeated
modification of the same code indicates a design that never stabilized, and unstable designs are the
most likely to contain subtle bugs because no single person ever fully understood all the
interactions), every commit whose message says "fix" or "bug" or "issue" or "regression" (on the
theory that these commits identify specific failure modes, and understanding every failure mode that
has already occurred is the best preparation for predicting failure modes that will occur in the
future), and every commit whose message references a bug tracker ID or a mailing list thread or a
specification document (on the theory that these references connect the commit to the broader context
in which the decision was made, and that context is essential for understanding the decision). The git
blame tool is the archaeologist's trowel for this phase: for every line of code that is
archaeologically significant, determine who wrote it, when they wrote it, what commit they wrote it as
part of, what other changes were in that commit, what the commit message said, what the referenced bug
tracker issue said, what the mailing list discussion said, and what was happening in the project and in
the world at the time that commit was made. This is tedious work, and it is essential work, and the
archaeologist who skips it is the archaeologist who will confidently explain the system's design
without understanding the history that produced that design, and will therefore be wrong in ways that
only become apparent when the system encounters conditions that the history would have explained. Every
line of code has a story, and the story contains the reasoning that produced the code, and the
reasoning is what the archaeologist needs to understand, not just the code that resulted from it. The
archaeologist who reads the code without reading the commit history is like a detective who examines
the crime scene without interviewing the witnesses; the physical evidence is necessary but
insufficient, and the story that ties the evidence together is what makes the evidence comprehensible.

**Phase E: Read the Mailing List Archives.** For open-source systems, the mailing list archives are
the closest thing to a verbatim transcript of the conversations that produced the system's design — not
the sanitized retrospective documentation that was written after the decisions were made, but the
actual arguments that occurred while the decisions were being debated, with all the false starts, dead
ends, personality conflicts, and rhetorical excess that characterize real engineering discussions.
Reading the mailing list archives means reading every discussion about design decisions (on the theory
that these discussions reveal the alternatives that were considered, the reasons they were rejected,
and the constraints that made the chosen design the least-bad option among a set of bad options), every
bug report (on the theory that bug reports from actual users reveal failure modes that the system's
designers never anticipated because the designers' mental model of how the system would be used was
incomplete), every "this doesn't work on my machine" thread (on the theory that these threads reveal
environmental dependencies that the system's designers never documented because they never realized
they were dependencies — the system worked in the environment where it was developed, and the fact that
it didn't work in other environments was discovered by users rather than by the designers, and the
archaeologists who only read the designers' documentation will never learn about these dependencies),
every response from the maintainer that reveals their philosophy (on the theory that maintainers
enforce consistency through their responses to proposals, and the pattern of which proposals are
accepted and which are rejected defines the system's architectural boundaries more precisely than any
architecture document ever could), every flame war (on the theory that flame wars occur when deeply
held beliefs about how systems should be designed come into conflict, and the substance beneath the
flames reveals the design values that the participants consider non-negotiable), every "this patch
breaks backward compatibility" discussion (on the theory that backward compatibility is the single most
powerful constraint on system evolution, and understanding exactly which existing behaviors are
considered sacrosanct is essential for predicting how the system will respond to proposed changes), and
every thread that starts with a question and ends without an answer (on the theory that unanswered
questions identify areas where the system's behavior is genuinely unknown even to its maintainers, and
these areas are where the most dangerous bugs will be found because nobody is watching them). The
mailing list archive is a time machine that transports the archaeologist back to the moment when each
decision was made, and the archaeologist who does not use this time machine is voluntarily operating
with less information than is available, which is a form of professional negligence when the system
under study is safety-critical. The discussions that occurred during the design of the Linux kernel's
completely fair scheduler, for example, contain more insight into the scheduler's behavior than any
documentation written after the fact, because the discussions capture the alternatives that were
rejected and the reasons for their rejection — information that is systematically absent from the final
documentation, which describes what was built rather than what was considered and rejected.

**Phase F: Read the Bug Tracker.** The bug tracker is the institutional memory of the system's
failures — every way the system has ever broken, every fix that was applied, every fix that was
proposed and rejected, every failure mode that was discovered, diagnosed, and resolved, every failure
mode that was discovered and never resolved, every failure mode that has not yet been discovered but
whose existence is implied by the pattern of resolved failures. Reading the bug tracker means reading
every closed bug with its resolution (on the theory that the fix applied to a bug is the minimum change
necessary to eliminate the observed symptoms, and comparing the fix to the original behavior reveals
the mechanism of the failure in a way that the bug report alone does not), every open bug (on the
theory that open bugs are failures that the system's maintainers know about but have not yet resolved,
and any system deployed in a safety-critical context must account for every known unresolved failure),
every "won't fix" entry with its justification (on the theory that "won't fix" defines the boundary of
what the system's maintainers consider acceptable brokenness, and this boundary is both a constraint on
what the archaeologist can expect the system to do and a map of the territory where the archaeologist
must implement their own fixes if the system is to be used beyond its maintainers' intended scope),
every duplicate bug (on the theory that bugs reported multiple times by different users in different
contexts are bugs that occur frequently in practice, and frequent bugs are the ones most likely to
cause failures in the archaeologist's use case regardless of their technical severity), every bug with
a severity classification (on the theory that the severity classification system reveals the
maintainers' values — what kinds of failures they consider catastrophic, what kinds they consider
annoying, what kinds they consider cosmetic — and these values define what the maintainers will
prioritize fixing, which in turn defines what the archaeologist must plan to fix themselves), every bug
that was closed as "invalid" or "not a bug" or "works as designed" (on the theory that these
classifications reveal the maintainers' interpretation of the system's intended behavior, and
discrepancies between the maintainers' interpretation and the users' interpretation identify areas
where the system's specification is ambiguous, and ambiguous specifications produce divergent
implementations, and divergent implementations produce integration failures), and every bug whose
resolution involved a design change rather than a simple code fix (on the theory that design-change
bugs reveal fundamental flaws in the system's architecture that could only be resolved by changing the
architecture, and understanding why the original architecture was flawed is the best protection against
repeating the same flaw in a new design). The bug tracker is the system's medical history, and the
archaeologist who designs a safety-critical system around a component without reading its bug tracker is
like a surgeon who operates without reading the patient's chart — technically possible, professionally
indefensible, and likely to produce outcomes that could have been prevented with a little more reading.

**Phase G: Read the Academic Papers.** Most practicing engineers dismiss academic papers as irrelevant
to practical work, and most of the time they are correct — the median academic paper describes a system
that was built to produce a publication rather than to solve a problem, and its findings are applicable
only within the artificial constraints of the experimental setup. But the papers that matter for
archaeological purposes are not the median papers; they are the papers at the extremes: the original
research that the system's designers cited when they made their fundamental architectural decisions,
the papers that cite the system (indicating that the system is significant enough to be studied), the
papers that found flaws in the system or its underlying theory, and the papers that describe
alternative approaches that the system's designers considered and rejected. Reading these papers means
understanding the theoretical foundations of the system's design, the experimental evidence that
supports or undermines those foundations, the alternative designs that were available at the time the
system was created, and the subsequent research that has validated or invalidated the assumptions
underlying the system. For a safe pod braking system based on a particular control theory approach, the
archaeologist must read the original paper that proposed that approach, the subsequent papers that
validated it in different contexts, the papers that identified edge cases where it fails, the papers
that proposed improvements, the papers that compared it to alternative approaches, and the papers that
applied it to systems with similar safety requirements to the safe pod. This reading serves two
purposes: it validates the archaeologist's reconstruction of the system's design logic by confirming
that the design decisions were consistent with the best available theory at the time, and it identifies
gaps in the theory that may manifest as unidentified failure modes in the system. A control algorithm
that was developed and validated for systems where actuator saturation is not a concern, when applied
to a safe pod braking system where actuator saturation is the primary failure mode in emergency
scenarios, contains an implicit assumption that the archaeologist must identify and challenge — and the
academic literature is often the only place where that assumption is explicitly stated and analyzed.
The paper that says "we assume actuator saturation does not occur in normal operation" is telling the
archaeologist exactly what conditions will cause the algorithm to fail, and that information will not
appear in the braking controller's documentation because the designer who selected the algorithm may
not have read the paper carefully enough to notice the assumption, or may have assumed that their
system would never encounter saturation, or may have simply forgotten to document the limitation.

**Phase H: Build a Mental Model.** This is the phase where all the evidence gathered in the previous
seven phases is synthesized into a single coherent representation of the system's behavior — not a
document, not a diagram, not a set of notes, but a mental model that lives in the archaeologist's head
and can be queried to predict the system's behavior under any condition the archaeologist can imagine.
Building this mental model means constructing a complete internal representation of: every component in
the system, its interface (inputs, outputs, side effects, failure modes), its implementation (the
algorithm or mechanism that transforms inputs into outputs), its assumptions about its environment
(preconditions that must be satisfied for the implementation to produce correct outputs), its
interactions with other components (both the documented interactions and the undocumented interactions
discovered through the archaeological process), its failure modes (every way it can produce incorrect
outputs, and the conditions under which each failure mode is triggered), and its design rationale (the
reason it was designed this way rather than any other way, given the constraints that the
archaeological process has reconstructed). The mental model must be complete enough that the
archaeologist can mentally execute the system — can trace an input from its point of entry through
every component it touches, predicting the state transformations at each step, until the output is
produced, and can do this for any input, normal or pathological, without consulting external
references. This is the standard that Torvalds applies to kernel subsystems before he is willing to
modify them, and it is the standard that Kiddo applies to opponents before she is willing to engage
them, and it is the standard that must be applied to any system whose failure could kill someone. The
mental model is built iteratively: start with the highest-level structural understanding, then drill
down into each component, then integrate the components back into the whole, then test the integration
by mentally executing specific scenarios, then refine the model anywhere the mental execution produces
a result that conflicts with the archaeological evidence. This iterative process continues until the
model explains every piece of evidence without contradiction — every design decision documented in the
mailing list archives, every bug reported in the bug tracker, every workaround described in the errata,
every comment in the source code, every test case in the test suite, every failure observed in the
field. A mental model that fails to explain any piece of evidence is an incomplete model, and an
incomplete model will produce incorrect predictions, and incorrect predictions in a safety-critical
context are unacceptable. The mental model is not a document but it must be documentable: the
archaeologist must be able to write down what the model predicts for any given condition, because
predictions that cannot be articulated cannot be tested, and predictions that cannot be tested cannot
be validated, and models that cannot be validated are theology, not archaeology.

**Phase I: Test the Model.** The mental model built in Phase H is a hypothesis about how the system
works. Phase I tests that hypothesis against reality. Testing the model means: for every assumption
encoded in the mental model, design an experiment that would violate the assumption if the assumption
is false, and run that experiment against the actual system. For a software system, this means writing
tests that exercise the system at the boundaries of its documented behavior — inputs at the extremes of
valid ranges, sequences of operations that should be idempotent but might not be, concurrent access
patterns that should be safe but might not be, resource exhaustion scenarios that should degrade
gracefully but might not — and comparing the observed behavior to the predicted behavior. For a
hardware system, this means operating the hardware at the boundaries of its specified operating
conditions — voltage levels at the minimum and maximum of the specified range, temperature at the
extremes of the industrial temperature range, clock frequencies at the tolerance limits, signal timing
at the setup and hold margins — and observing whether the behavior matches the mental model's
predictions. For a material system, this means testing material samples under the full range of
environmental conditions they will encounter in service — temperature cycling, humidity exposure,
chemical contact, mechanical stress, radiation exposure, vibration — and comparing the degradation
patterns to the model's predictions. The key to effective model testing is that tests must be designed
to falsify the model, not to confirm it. The natural human tendency is to design tests that the model
will pass, because passing tests feels like progress and failing tests feels like failure. But in the
archaeological context, a passing test provides almost no information — it confirms that the model
works in a case where the archaeologist already believed it would work — while a failing test provides
immense information: it identifies a specific way in which the archaeologist's understanding of the
system is wrong, and it provides the evidence needed to correct that understanding. The archaeologist
must therefore cultivate a perverse enthusiasm for failing tests: every failing test is a gift from the
universe, a free lesson about a gap in the archaeologist's knowledge that would otherwise have
manifested as a failure in the field, where the cost of failure is measured in safe pod occupants
rather than in debugging time. The Thompson gonzo approach to test design is useful here: design the
most aggressive, most unfair, most "nobody would ever do that" tests first, because if the system
survives those, it will probably survive anything, and if it doesn't, you've found the failure
boundary quickly rather than after days of gentle testing that never quite reaches the edge of the
envelope. For a safe pod braking controller, this means: disconnecting sensors mid-braking, injecting
electromagnetic interference into the sensor wiring, varying the supply voltage across its entire
tolerance range during an emergency stop, commanding contradictory brake forces on different wheels
simultaneously, simulating sensor failure modes that have never occurred in the field but are
physically possible given the sensor's design — and doing all of this on a test bench with no
occupants, because the whole point of testing is to discover the failure modes before they discover
you. The test that feels cruel and unfair is the test that most closely approximates the cruelty and
unfairness of the real world, which does not care about your model's assumptions and will violate them
without warning.

**Phase J: Refine.** Every test that the model fails reveals an error in the archaeologist's
understanding. Phase J is the process of determining the nature of that error, correcting the mental
model, and then returning to Phase H with the corrected model, iterating until the model correctly
predicts the outcome of every test the archaeologist can devise. Refinement is not a separate phase
that occurs after testing; it is the recursive loop that connects testing back to model building, and
the archaeologist who treats refinement as a phase to be completed before moving on has misunderstood
the nature of archaeological knowledge. The model is always wrong in some way; the question is whether
the ways in which it is wrong are relevant to the use the archaeologist intends to make of it. For a
safety-critical system, the standard is that the model must be correct in every way that could affect
the safety of the system's operation, which means the model must be correct in every way that affects
the system's behavior under any condition that could occur during operation, which means the model must
be effectively perfect with respect to all safety-relevant behaviors. Achieving this standard requires
not just correcting the model when tests fail, but actively searching for conditions under which the
model might fail — conditions that the archaeologist's tests have not yet covered, conditions that the
system's original designers did not anticipate, conditions that have never occurred in the field but
are physically possible given the laws of physics and the characteristics of the system's components.
This active search for unknown failure modes is the most difficult part of the archaeological process
because it requires the archaeologist to imagine conditions outside their own experience, and the human
imagination is constrained by experience in ways that are difficult to overcome. The technique for
overcoming this constraint is systematic rather than creative: enumerate every assumption in the mental
model, then for each assumption, enumerate every way the assumption could be violated, then for each
violation, determine whether the mental model predicts the system's behavior under that violation, and
if it does not, design a test that creates the violation and observe the actual behavior. This is
tedious, exhaustive, and absolutely necessary, because the failure mode that kills safe pod occupants
will be the one the archaeologist didn't think to investigate because it required violating an
assumption that everyone involved in the system's design considered so obvious that they never stated
it explicitly — and the archaeological process exists precisely to make implicit assumptions explicit,
so they can be tested, challenged, and either validated or corrected. The refinement loop is endless in
theory but terminates in practice when the archaeologist has exhausted their ability to imagine
conditions that the model does not correctly predict, at which point the model is as complete as the
archaeologist can make it, and the residual risk is the risk of conditions that neither the original
designers nor the archaeologist could imagine — a risk that can only be managed through operational
monitoring, redundancy, and a healthy humility about the limits of human foresight.

---

## 3. APPLYING ARCHEOLOGY TO NON-SOFTWARE SYSTEMS

The archaeology protocol was developed for software systems, but its applicability extends to any
system whose behavior emerges from the interaction of components designed by humans operating under
constraints, because the fundamental epistemological problem is the same in every domain: the system's
documented behavior is an approximation of its intended behavior, the system's actual behavior is a
consequence of its implementation, the gap between documented behavior and actual behavior is where
failures occur, and understanding that gap requires reconstructing the system's design logic from the
available evidence. The following adaptations of the protocol to specific non-software domains are
provided as templates; the archaeologist must adapt these templates to the specific characteristics of
whatever system they are studying, following the same principle: identify the categories of evidence
that exist, acquire evidence from every category, synthesize the evidence into a mental model, test
the model against reality, refine until the model is correct. The domain-specific adaptations are not
separate protocols but instantiations of the same protocol with different evidence sources, and the
archaeologist who understands the protocol's structure can apply it to any system by identifying what
serves as the datasheet, what serves as the errata, what serves as the source code, and so forth, for
that particular system type.

**Material Systems.** A material — a specific alloy, polymer, ceramic, composite, or coating — is a
system whose components are atoms, crystal structures, phase boundaries, grain boundaries,
dislocations, and defects, and whose behavior emerges from the interaction of these components under
applied stress, temperature, chemical environment, and radiation exposure. The archaeological approach
to a material system begins with Phase A (Read the Datasheet): the material datasheet provided by the
manufacturer, which specifies the material's nominal composition, mechanical properties (yield
strength, ultimate tensile strength, elongation, hardness, impact toughness), thermal properties
(melting point, glass transition temperature, coefficient of thermal expansion, thermal conductivity,
specific heat), electrical properties (conductivity, dielectric strength, dielectric constant),
chemical properties (corrosion resistance in specified environments, compatibility with specified
chemicals), and processing guidelines (recommended forming temperatures, heat treatment schedules,
welding parameters, surface preparation requirements). The datasheet is the material's contract with
its users, and like all contracts, it contains both promises and limitations — the yield strength is
guaranteed under specified test conditions, but the material's behavior under conditions not covered by
the datasheet is the user's problem, not the manufacturer's. Phase B (Read the Errata) for materials
means reading the manufacturer's technical bulletins, which document batch-to-batch variations, process
changes, specification revisions, and known issues with specific lots or production periods — the
material equivalent of silicon errata. Phase C (Read the Source Code) for materials means reading the
published characterization studies: the academic papers and industry reports that have measured the
material's properties under conditions beyond those specified in the datasheet, including the
conditions under which the material's behavior deviates from the datasheet predictions. These studies
are the material's "source code" — they reveal the actual behavior rather than the specified behavior —
and the archaeologist who relies solely on the datasheet is the engineer who specifies a material for
an application where it will be exposed to conditions that the datasheet didn't cover, and discovers
the gap between specification and reality when the material fails in service. Phase D (Read the Commit
History) for materials means reading the manufacturer's quality control records for every batch of
material that will be used in the archaeologist's application — the actual composition, the actual
mechanical properties, the actual processing history, the actual deviations from the nominal
specification. A material whose composition is within the specified range but at the extreme end of
that range may behave differently from a material at the center of the range, and the datasheet's
"typical" values assume the center of the range; the quality control records reveal where each batch
actually falls. Phase G (Read the Academic Papers) for materials means reading the failure analysis
literature: the case studies of material failures in service, the root cause analyses, the lessons
learned, the design changes that were implemented to prevent recurrence. These papers are the
material's bug tracker — they document every known failure mode, every condition that triggered it,
every mitigation that was developed — and the archaeologist who doesn't read the failure analysis
literature is doomed to rediscover known failure modes through the expensive process of experiencing
them firsthand. The mental model for a material system must account for: the material's composition and
microstructure at every relevant scale (atomic, nano, micro, macro), the relationship between
microstructure and properties, the mechanisms by which the microstructure degrades under service
conditions (fatigue, creep, corrosion, wear, radiation damage, thermal aging), the rate at which each
degradation mechanism operates under the specific conditions of the archaeologist's application, and
the failure modes that occur when the degradation reaches critical levels. Testing the model means
accelerated life testing under conditions that simulate the most aggressive combination of stressors
the material will encounter in service, with continuous monitoring of the relevant degradation
indicators, and comparison of the observed degradation rates and failure modes to the model's
predictions. The refinement loop continues until the model correctly predicts the material's behavior
under all test conditions, at which point the model can be used to design components whose service life
is predictable with sufficient confidence for safety-critical application.

**Regulatory Frameworks.** A regulatory framework — a set of laws, rules, standards, and enforcement
mechanisms that govern some category of human activity — is a system whose components are legal texts,
regulatory agencies, enforcement actions, judicial interpretations, and the regulated entities
themselves, and whose behavior emerges from the interaction of these components over time. The
archaeological approach to a regulatory framework is structurally identical to the approach to a
software system, but the categories of evidence are different: the "datasheet" is the regulation itself
(every section, every subsection, every definition, every cross-reference, every footnote, every
effective date, every amendment, every exception, every exemption procedure), the "errata" are the
regulatory agency's published interpretations and guidance documents (which clarify what the regulation
actually means in practice, often revealing that the plain language means something quite different
from what a reasonable person would infer), the "source code" is the enforcement actions (which reveal
what the regulators actually enforce, as opposed to what the regulation says they can enforce, and the
gap between the two is where regulatory risk lives), the "commit history" is the rulemaking record (the
notice of proposed rulemaking, the public comments, the agency's responses to comments, the final rule,
the subsequent amendments — each of which is a decision made under specific constraints that shaped the
final text), the "mailing list archives" are the transcripts of legislative hearings and regulatory
proceedings (where the arguments for and against specific provisions were made, and where the
compromises that produced ambiguous language were negotiated), the "bug tracker" is the enforcement
action database (every violation that was cited, every penalty that was assessed, every appeal that was
filed, every settlement that was negotiated — the institutional memory of the framework's failures),
and the "academic papers" are the law review articles and regulatory analyses that critique the
framework, propose alternatives, identify gaps, and predict consequences. The archaeologist's mental
model for a regulatory framework must account for: the explicit requirements (what the regulation says
you must do), the implicit requirements (what the enforcement history shows you must do regardless of
what the regulation says), the safe harbors (actions that the regulation explicitly protects from
enforcement), the gray areas (actions that the regulation does not explicitly address and that have not
been tested in enforcement actions), the penalty structure (what happens when you violate each
requirement, and how that penalty is calculated), the enforcement priorities (what the regulators
currently care about most, which may differ from what the regulation suggests they should care about),
and the trajectory (how the framework is evolving, based on recent enforcement actions, proposed
amendments, and political developments, which determines what actions that are currently legal may
become illegal in the future). For a safe pod manufacturer navigating the regulatory framework
governing autonomous vehicle safety certification, this model is not optional — it is the difference
between a certification strategy that succeeds and a certification strategy that fails after years of
development effort, and the archaeologist who treats the regulation as a simple checklist rather than
as a system to be reconstructed will discover the gap between checklist compliance and actual
compliance only when the certification authority rejects their application.

**Organizational Systems.** An organizational system — a company, a division, a team, a process, a
supply chain, a decision-making structure — is a system whose components are people, roles,
relationships, incentives, information flows, decision rights, and cultural norms, and whose behavior
emerges from the interaction of these components in ways that are often invisible to the people inside
the system and frequently inconsistent with the organization's official description of itself. The
archaeological approach to an organizational system begins with Phase A (Read the Datasheet): the
organizational chart, the process documentation, the job descriptions, the responsibility matrices, the
decision authority frameworks, the escalation procedures, the communication protocols — everything the
organization says about how it works. The archaeologist reads these documents with the same skepticism
they apply to a software system's architecture documentation: the documents describe how the
organization was designed to work, not how it actually works, and the gap between the two is where
organizational failures occur. Phase B (Read the Errata) means reading the meeting minutes, the project
postmortems, the incident reports, the reorg announcements, the departure memos — the documents that
record what actually happened as opposed to what was supposed to happen. Every reorg is an
acknowledgment that the previous organizational structure was not working; every project postmortem
identifies specific failures in the organization's processes; every departure memo, if the departing
person was honest about their reasons, reveals a gap between the organization's stated values and its
actual behavior. Phase C (Read the Source Code) means interviewing the people — not the official
spokespeople who will recite the official narrative, but the individual contributors who do the actual
work, the middle managers who translate between strategic intent and operational reality, the veterans
who remember why certain processes exist and what happened the last time someone tried to eliminate
them, the newcomers who can see the organizational pathologies that the veterans have learned to
ignore. These interviews are the organizational equivalent of reading the source code, and like reading
source code, the critical skill is distinguishing between what the code says it does and what it
actually does — between what the interviewee says the process is and what the interviewee describes
actually happening when the process is followed. Phase D (Read the Commit History) means tracing the
history of organizational changes: every reorg, every process change, every tool migration, every
leadership transition, every strategic pivot. Each of these changes was a decision made under
constraints, and reconstructing those constraints reveals why the organization is the way it is — why
certain teams have more influence than their position on the org chart would suggest, why certain
processes are followed rigorously while others are ignored, why certain decisions are made quickly
while others are endlessly deferred, why certain people have informal authority that exceeds their
formal authority. Phase F (Read the Bug Tracker) means studying the organization's failure history:
every missed deadline, every budget overrun, every quality escape, every safety incident, every
lawsuit, every regulatory violation, every PR crisis. Each of these failures was produced by the
interaction of the organization's components under specific conditions, and understanding the mechanism
of each failure — tracing it back through the decisions, assumptions, incentives, and information flows
that produced it — reveals the organization's actual failure modes, which are almost never the failure
modes described in the organization's risk register because risk registers describe what people are
afraid of, not what actually happens. The mental model for an organizational system must account for:
the formal structure (who reports to whom, who has decision authority over what), the informal
structure (who actually influences decisions regardless of their formal authority), the incentive
structure (what behaviors are rewarded, what behaviors are punished, what behaviors are tolerated
despite being officially discouraged), the information structure (who knows what, who needs to know
what, what information flows reliably, what information is systematically distorted or suppressed), the
cultural structure (what the organization actually values as demonstrated by its actions rather than by
its stated values), and the temporal structure (how the organization has evolved over time and what
trajectory it is on). This model is essential for the safe pod engineer who needs to get a
safety-critical change implemented in an organization whose processes and incentives may not be aligned
with safety-critical engineering practices — and the archaeologist who skips the organizational
archaeology and focuses solely on the technical archaeology may produce a technically perfect solution
that the organization rejects, subverts, or implements incorrectly because the archaeologist didn't
understand the system into which they were introducing the solution.

---

## 4. THE TORVALDS KERNEL-READING METHOD

The Torvalds kernel-reading method is a specific technique for approaching a large, unfamiliar codebase
and achieving complete understanding of its structure and behavior without reading every line — an
impossibility for systems like the Linux kernel, which contains tens of millions of lines — by instead
tracing execution paths from entry points to exit points and understanding every decision point along
each path. The method is based on the observation that a software system is a directed graph of control
flow, and that understanding the graph requires understanding every node (function, method, procedure)
and every edge (function call, interrupt, signal, exception, callback, event handler) in the graph, but
does NOT require understanding every line of code in every node — only the lines that affect control
flow, data flow, or system state in ways that are relevant to the archaeologist's purpose. The method
proceeds through six sequential steps that must be applied to every entry point into the system,
because every entry point represents a distinct path by which external stimuli can influence the
system's behavior, and a path that is not understood is a path that can surprise the archaeologist with
behavior they did not predict. Step one: Identify every entry point into the system — every system
call, every interrupt handler, every signal handler, every callback registration point, every event
loop iteration, every message queue consumer, every network socket listener, every file descriptor that
can be read, every memory-mapped register that can be accessed, every hardware interrupt line that can
be asserted, every timer that can fire, every DMA completion that can trigger. An entry point is any
mechanism by which an external stimulus can cause code in the system to execute, and the complete set
of entry points defines the system's attack surface — the set of all paths by which the outside world
can influence the system's behavior. Step two: For each entry point, trace the execution path from
entry to every possible exit — every return statement, every error handling path, every panic or abort,
every longjmp, every context switch that transfers control to another thread, every asynchronous
completion that triggers a callback. The trace must follow every branch (if statement, switch
statement, conditional operator, polymorphic dispatch, function pointer call, signal handler, exception
handler, setjmp/longjmp pair), and for each branch, the archaeologist must understand: what condition
determines which branch is taken, what happens in each branch, what happens after the branches rejoin
(if they rejoin), and what assumptions about system state are encoded in the condition. Step three: For
each function called along the execution path, understand: its interface (parameters, return value,
side effects, error conditions), its implementation (the algorithm it executes, the data structures it
manipulates, the assumptions it makes about its inputs and about system state), its locking behavior
(what locks it acquires, in what order, for what duration, and whether the locking order is consistent
with the locking order of other functions that may be called concurrently), its resource usage (what
memory it allocates, what file descriptors it opens, what hardware resources it claims, and whether it
releases all resources on every exit path including error paths), and its failure modes (every way it
can produce incorrect output or leave the system in an inconsistent state, and the conditions under
which each failure mode is triggered). Step four: For each data structure accessed along the execution
path, understand: its layout in memory, its invariants (conditions that must always be true for the
data structure to be considered valid), the set of functions that modify it, the locking discipline
that protects it, the consistency requirements that must be maintained between it and other data
structures, and the conditions under which its invariants can be violated. Step five: For each lock
acquired along the execution path, understand: what it protects, its type (mutex, spinlock, rwlock,
RCU, seqlock, etc.), the locking order rules that govern it, the conditions under which it can
deadlock, the conditions under which it can cause priority inversion, and the worst-case duration for
which it can be held. Step six: For each assumption about hardware behavior encoded in the software,
verify the assumption against the hardware's datasheet and errata, because software assumptions about
hardware that are inconsistent with actual hardware behavior are the most common source of the most
difficult bugs in systems that interact directly with hardware. This method, applied systematically to
every entry point, produces complete understanding of the system's behavior — not because the
archaeologist has read every line of code, but because the archaeologist has understood every mechanism
by which the system's behavior can be influenced and every decision the system makes in response to
that influence. The method scales sublinearly with codebase size: a codebase that is ten times larger
typically has only slightly more entry points than a codebase that is ten times smaller, because the
complexity of a system's interface grows with the square root of its internal complexity — Brooks'
observation about conceptual integrity applied to interface design. The method also naturally
identifies dead code — functions that are not reachable from any entry point — which is
archaeologically significant because dead code represents functionality that was once needed, was
removed from all callers, but was never deleted from the codebase, and the presence of dead code
indicates either incomplete refactoring or an intention to restore the functionality in the future, and
understanding which requires understanding the commit history of the dead code and its former callers.

The kernel-reading method generalizes to non-software systems by identifying the system's "entry
points" — the interfaces at which external stimuli enter the system — and tracing their propagation
through the system's internal structure. For a mechanical system, the entry points are the points where
forces are applied to the system (load application points, mounting points, thermal expansion
interfaces, vibration inputs from the environment), and tracing their propagation means understanding
how force flows through the structure from each entry point to every constraint, how the structure's
geometry and material properties determine the stress distribution, how the stress distribution
determines the failure modes, and how the failure modes interact with each other under combined
loading. For an electrical system, the entry points are the power supply inputs, signal inputs,
electromagnetic interference sources, and environmental conditions (temperature, humidity) that affect
component behavior, and tracing their propagation means understanding how signals flow through the
circuit, how noise couples into signal paths, how power supply variations affect circuit behavior, how
component tolerances combine to produce output variation, and how component failure modes propagate
through the circuit. For a chemical process, the entry points are the feedstock inputs, the catalyst
additions, the energy inputs (heating, cooling, mixing), and the environmental conditions (pressure,
atmosphere composition), and tracing their propagation means understanding the reaction kinetics, the
mass and energy balances, the mixing and separation operations, the control system logic, and the
failure modes that occur when any input deviates from its specified range. In every case, the principle
is the same: start at the interface where the outside world touches the system, trace the effects of
that contact through every component it touches, understand every decision point along the path, and
continue until the cascade of effects reaches a terminal state — an output, a failure, or a stable
equilibrium. The archaeologist who has traced every entry point to every terminal state understands the
system completely, regardless of the system's domain, because completeness of understanding is defined
by coverage of the entry-point-to-terminal-state graph, not by coverage of the system's internal
component count.

---

## 5. THE KIDDO OPPONENT-ANALYSIS METHOD

The Kiddo opponent-analysis method is a specific technique for understanding a system's weaknesses by
approaching the system as an adversary rather than as a collaborator — by asking not "how does this
system work under normal conditions?" but "how can I make this system fail, and what does the pattern
of possible failures reveal about its design?" The method is based on the martial arts principle that
understanding a technique requires understanding not just how to execute it correctly but how to
counter it — that the counter reveals the technique's vulnerabilities, and the vulnerabilities reveal
the technique's essential structure in a way that correct execution alone never could. Applied to
technical systems, this means: observe the system's behavior under normal conditions to establish
baseline expectations, identify the patterns in the system's behavior (what it does consistently, what
it does intermittently, what it never does, what it does only under specific conditions), identify the
system's weaknesses (the conditions under which its behavior deviates from normal in ways that could be
exploited), identify the system's expectations about how it will be attacked (the defenses it has, the
error handling it implements, the invariants it checks, the assertions it validates), and then attack
the system in ways that violate its expectations — at the boundaries of its input validation, at the
edges of its resource management, at the intersections of its concurrency control, at the gaps in its
error recovery, at the assumptions it makes about its operating environment that may not hold in the
archaeologist's deployment context. The method is adversarial but not malicious: the goal is not to
destroy the system but to understand it, and understanding a system requires understanding its failure
modes, and understanding failure modes requires attempting to trigger them under controlled conditions
where the consequences of failure are limited to a test environment rather than a production
deployment. The engineer who is afraid to find failures in their system is the engineer whose system
will fail in the field, because failures that are not discovered in testing will be discovered by the
operating environment, and the operating environment is a far less forgiving teacher than a test bench.

The Kiddo method proceeds in three phases: observation, analysis, and exploitation. During observation,
the archaeologist monitors the system under normal operation, recording every externally observable
behavior — every output, every state transition, every timing characteristic, every resource
consumption pattern, every error message, every log entry, every performance metric — without
attempting to influence the system's behavior. The goal of observation is to establish a baseline of
normal behavior so that deviations from normal are immediately recognizable, just as Kiddo observes an
opponent's stance, movement patterns, breathing rhythm, and eye movements to establish a baseline
against which feints and attacks are measured. During analysis, the archaeologist examines the evidence
gathered in the archaeological phases (datasheet, errata, source code, commit history, mailing list
archives, bug tracker, academic papers) to identify potential vulnerabilities — places where the
system's implementation may not match its specification, where its assumptions about its environment
may not hold, where its error handling may be incomplete, where its resource management may be
vulnerable to exhaustion, where its concurrency control may have race conditions or deadlocks, where
its input validation may be bypassable, where its state machine may have unreachable states or
unintended transitions. During exploitation, the archaeologist designs and executes tests that attempt
to trigger each identified vulnerability, observing whether the system fails, how it fails, and whether
the failure mode matches the mental model's prediction. The exploitation phase is what distinguishes
the Kiddo method from conventional testing: conventional testing verifies that the system behaves
correctly under specified conditions; the Kiddo method attempts to make the system behave incorrectly
under any condition that is physically possible, regardless of whether the specification considers that
condition valid. The shift in perspective is subtle but profound: the conventional tester asks "does
this system meet its requirements?" while the Kiddo archeologist asks "what are the limits of this
system's ability to maintain correct behavior, and what lies beyond those limits?" The first question
produces a pass/fail judgment; the second produces a map of the system's failure surface, which is far
more valuable for safety-critical engineering because it tells you not just whether the system passed a
particular test but what conditions will cause it to fail, how those conditions can arise in practice,
and what the consequences of failure will be. A system that passes every specified test but fails
catastrophically under an unspecified condition is a system that has been verified but not understood,
and verification without understanding is the engineering equivalent of crossing a minefield by
following the footsteps of the person who crossed before you — it works until you encounter a mine
that the previous person happened not to step on.

The Kiddo method applied to a safe pod braking controller would proceed as follows: observe the
controller's behavior during normal braking — the sensor readings it receives, the actuator commands it
issues, the timing of its control loop, the feedback it provides to higher-level systems, the
diagnostic messages it logs. Analyze the controller's design — the control algorithm it implements, the
assumptions that algorithm makes about sensor accuracy and actuator response, the fault detection and
isolation logic, the redundancy management strategy, the fail-safe behavior when a fault is detected,
the fail-operational behavior when continued operation is required despite a fault. Then exploit: inject
sensor readings that are within the valid range but inconsistent with each other (the left wheel speed
sensor reports 30 mph while the right reports 10 mph — does the controller detect the inconsistency or
does it average the readings and apply a brake force appropriate for 20 mph?), inject sensor readings
that are at the extreme boundaries of the valid range (wheel speed of 0 and wheel speed of maximum
representable value in adjacent control cycles — does the controller's derivative term produce an
enormous spike that saturates the actuator?), inject sensor readings that change faster than the
physical system can change (instantaneous transition from dry pavement to ice — does the controller's
state estimation catch up or does it apply the wrong brake force for several control cycles?), vary the
supply voltage across its entire specified range during an emergency stop (does the controller's
analog-to-digital conversion remain accurate, or do the sensor readings shift with supply voltage in
ways the software doesn't compensate for?), introduce electromagnetic interference on the sensor wiring
that produces occasional bit errors in the digital sensor data (does the controller's CRC check catch
the errors, or do corrupted readings propagate through the control algorithm?), command contradictory
brake force targets on different wheels while the vehicle is in a turn (does the controller's stability
logic intervene, or does it obediently apply the commanded forces and spin the vehicle?), simulate the
failure of individual components — a wheel speed sensor that stops reporting, a brake actuator that
reports a fault, a communication bus that drops messages, a power supply that browns out — and observe
whether the controller's fault response is graceful, predictable, and safe. Each of these tests is
designed not to verify that the controller meets its specification but to find the boundaries of its
specification and the behavior beyond those boundaries, because safe pod occupants will experience
those boundaries whether or not the specification acknowledges them, and the engineer's job is to
ensure that the behavior beyond the boundaries is safe, not to pretend that the boundaries don't exist.

---

## 6. THE ARCHEOLOGICAL REPORT

The archeological report is the output of the archeological process — not a conventional technical
document but a comprehensive reconstruction of the system's design logic, written in the gonzo
documentation style that Thompson brought to journalism and that KEYMAKER adapts to technical writing:
first-person, present-tense, brutally honest, with the archaeologist's thought process visible on the
page so that readers can evaluate not just the conclusions but the reasoning that produced them. The
report has ten mandatory sections, each of which must be present in every report regardless of the
system being studied, though the relative length of each section will vary depending on the system's
characteristics and the archaeologist's purpose. The gonzo style is not an affectation; it is an
epistemological tool. By exposing the reasoning process — the false starts, the dead ends, the
assumptions that were tested and found wanting, the evidence that was initially misinterpreted and
later reinterpreted — the gonzo report allows the reader to evaluate the quality of the archaeological
work, not just accept its conclusions. A conventional report that states conclusions without showing
the evidence and reasoning that produced them is indistinguishable from a report that fabricates its
conclusions, and in a safety-critical context, the reader must be able to distinguish between the two.
The gonzo report makes fabrication difficult because it requires the author to document the process by
which each conclusion was reached, and a fabricated process will contain inconsistencies that a real
process would not. The ten sections of the archeological report are as follows.

**Section A: What the System Was Designed to Do.** This section reconstructs the system's intended
behavior as understood by its original designers, based on the sum of all archaeological evidence — the
specification documents, the source code comments, the commit messages, the mailing list discussions,
the academic papers cited by the designers, the marketing materials (which, despite their promotional
nature, often contain the clearest statement of what the designers thought was important about their
system), and the pattern of features that were prioritized over other features (which reveals the use
cases the designers considered most important). The reconstruction must be stated in the designers' own
terms and conceptual framework, not in the archaeologist's terms — the archaeologist who imposes their
own conceptual framework on the designers' intent has failed to understand the system as its designers
understood it, and will therefore misinterpret design decisions whose rationale was specific to a
different conceptual framework. This section must include: the problem the system was designed to
solve, the constraints under which the designers were operating (technical constraints, schedule
constraints, resource constraints, organizational constraints, regulatory constraints, market
constraints), the key architectural decisions they made and their stated rationale for each decision,
the tradeoffs they explicitly acknowledged (the things they knew they were sacrificing to achieve their
primary goals), and the use cases they explicitly excluded from scope (the things the system was not
designed to do, which are often as revealing as the things it was designed to do). A braking controller
that was designed for passenger vehicles but is being considered for a safe pod is a system being used
outside its intended scope, and the archaeologist who does not document this scope mismatch is setting
up the safe pod for a failure that could have been anticipated.

**Section B: What Constraints the Designers Were Operating Under.** This section goes beyond the
constraints acknowledged in Section A to reconstruct the constraints that the designers may not have
been consciously aware of — the implicit assumptions, the cultural norms, the technological limitations
of their era, the organizational incentives, the intellectual debts to previous systems. These are the
constraints that the designers didn't document because they didn't think of them as constraints; they
thought of them as reality. A designer working in 1995 assumed that memory was measured in megabytes,
that network latency was measured in milliseconds, that threads were expensive, that floating-point was
slow, that users would tolerate command-line interfaces — none of which would appear in the design
documentation as explicit assumptions because they were simply the water in which the designer swam.
The archaeologist's task is to reconstruct this water: to identify every assumption that was so obvious
to the designers that they never thought to state it, and to evaluate whether that assumption still
holds in the context where the archaeologist intends to deploy the system. For a safe pod braking
controller designed in 2010, the designers may have assumed that the vehicle's inertial measurement
unit would always be operational during braking, because the vehicles they were designing for had IMUs
that were powered independently of the braking system — an assumption that would not survive the
transition to a safe pod architecture where the IMU shares a power supply with the braking controller
and both can fail simultaneously during an electrical fault. The archaeologist who misses this implicit
assumption will not understand why the controller behaves erratically during combined power and braking
failures, and will waste time debugging the controller when the problem is the assumption that was
never stated.

**Section C: What Decisions They Made and Why.** This section reconstructs the decision tree that
produced the system's architecture, starting from the earliest design decisions (what language to use,
what operating system to target, what communication protocols to support, what data formats to define)
and proceeding through the successive decisions that refined the architecture into its final form. For
each decision, the archaeologist must answer: what alternatives were considered, what criteria were
used to evaluate the alternatives, what evidence was available at the time the decision was made, what
evidence became available later that would have changed the decision if it had been available earlier,
and what the consequences of the decision have been — both the intended consequences and the unintended
consequences that emerged as the system evolved. This section is the core of the archaeological
reconstruction because it explains not just what the system is but why it is that way rather than any
other way, and this explanation is what enables the archaeologist to predict how the system will
respond to changes, because changes that are consistent with the original design rationale will be
absorbed smoothly while changes that conflict with the original rationale will encounter resistance at
every level of the system's architecture. A braking controller that uses a particular PID tuning method
because the designer had experience with that method and it worked well enough for the original
application may fail when the safe pod's different mass distribution changes the system dynamics, and
the archaeologist who understands why the original tuning method was chosen can evaluate whether a
different method is needed rather than blindly re-tuning the existing method beyond its range of
applicability.

**Section D: What They Got Right.** This section identifies the design decisions that proved to be
correct — the architectural choices that withstood the test of time, the interfaces that accommodated
unforeseen requirements without breaking, the abstractions that remained useful as the system evolved,
the performance optimizations that remained effective as hardware changed, the safety mechanisms that
prevented failures from propagating, the error handling strategies that turned catastrophic failures
into graceful degradations. This section serves two purposes: it validates the archaeological
reconstruction by confirming that the archaeologist has correctly identified which decisions were good
decisions (a reconstruction that cannot distinguish between good and bad decisions is a reconstruction
that doesn't understand the system's context), and it provides positive examples that can be applied to
future systems — design patterns that worked, assumptions that held, approaches that proved robust. The
safe pod engineer who can identify what the designers of previous safety-critical systems got right is
the engineer who can incorporate those proven patterns into new designs rather than rediscovering them
through the expensive process of getting them wrong first. The aerospace industry's use of triple
redundancy with voting, for example, is a pattern that has been validated across decades of flight
experience, and the archaeologist who understands why it works and under what conditions it fails can
apply it appropriately to safe pod systems rather than either blindly adopting it or arrogantly
rejecting it.

**Section E: What They Got Wrong.** This section identifies the design decisions that proved to be
incorrect — the architectural choices that created problems, the interfaces that broke under unforeseen
requirements, the abstractions that leaked, the performance optimizations that became pessimizations as
hardware evolved, the safety mechanisms that created new failure modes while preventing old ones, the
error handling strategies that turned graceful degradations into silent failures. This section must
resist the temptation of retrospective superiority: the archaeologist who judges past decisions by
present knowledge is not doing archaeology but confirmation bias, because every decision looks obvious
in hindsight and every mistake looks stupid when you already know the consequences. The correct
approach is to evaluate each decision against the information available to the designers at the time
they made it: given what they knew then, given the constraints they were operating under, given the
alternatives that existed, was their decision reasonable? If the decision was reasonable given the
information available, the lesson is not that the designers were incompetent but that the available
information was incomplete, and the preventive measure is to improve information gathering, not to
replace the designers. If the decision was unreasonable even given the information available, the
lesson is that the designers' decision-making process was flawed, and the preventive measure is to
improve the process. This distinction is critical because it determines whether the archaeologist's
recommendations will address root causes or symptoms, and recommendations that address symptoms rather
than root causes will not prevent recurrence.

**Section F: What They Didn't Foresee.** This section identifies the conditions that the system's
designers did not anticipate — the use cases they didn't imagine, the environmental conditions they
didn't consider, the failure modes they didn't protect against, the interactions between components
they didn't analyze, the changes in the operating context that invalidated their assumptions. This is
the most difficult section to write because it requires the archaeologist to identify things that are
absent from the evidence — conditions that were not discussed, scenarios that were not tested,
assumptions that were not stated — and absence of evidence is not evidence of absence. The technique is
to enumerate the conditions that the system has actually encountered that caused failures, and then to
ask: could the designers have anticipated this condition? If yes, why didn't they? If no, what does the
pattern of unanticipated conditions reveal about the boundaries of the designers' mental model? The
answer to this last question is the most valuable output of the archaeological process, because it
identifies the systematic blind spots in the designers' thinking — the kinds of things they
consistently failed to consider — and these blind spots are likely to be present in other systems
designed by the same people or by people with similar backgrounds, and understanding them allows the
archaeologist to look specifically for similar blind spots in related systems. A team that
consistently failed to consider what happens when two independent failures occur simultaneously, for
example, has a systematic blind spot that will affect every system they design, and the archaeologist
who identifies this blind spot can check every design decision for its vulnerability to simultaneous
failures.

**Section G: What the System Actually Does.** This section describes the system's actual behavior — not
its intended behavior, not its documented behavior, but what it actually does when you exercise it
across the full range of conditions identified in the archaeological process. This is the ground truth
against which all other sections are measured, and it must be stated with absolute precision: for every
input condition, for every system state, for every environmental parameter, the archaeologist must be
able to state what output the system produces, what state transitions it undergoes, what side effects
it causes, and what error conditions it reports. This section is written as a behavior specification —
a complete, unambiguous description of the system's input-output mapping — that can be used to verify
that any modification to the system preserves the behaviors that must be preserved and changes only the
behaviors that are intended to change. For a safe pod braking controller, this section would specify:
for every combination of wheel speed sensor readings, brake pedal position, vehicle speed, road surface
condition estimate, battery voltage, system temperature, and fault status, exactly what brake force the
controller will command on each wheel, within what timing tolerance, with what diagnostic output, and
under what conditions it will transition to a degraded mode or a fail-safe state. This specification is
the deliverable that the safe pod integration team needs to verify that the braking controller will
behave correctly in the integrated vehicle, and it is the deliverable that can only be produced by the
complete archaeological process. Any document that claims to describe what the system does but was not
produced by the archaeological process is describing what someone believes the system does, which may
or may not correspond to what the system actually does, and in a safety-critical context, the
difference between belief and reality is the difference between occupants who arrive safely and
occupants who do not arrive at all.

**Section H: Under What Conditions It Will Fail.** This section describes the system's failure surface
— the set of conditions under which the system's behavior deviates from its specification in ways that
could cause harm. For each identified failure mode, the archaeologist must specify: the exact
conditions that trigger the failure (input values, system state, environmental parameters, timing
conditions), the mechanism by which the failure occurs (the sequence of events inside the system that
leads from the triggering condition to the incorrect behavior), the consequences of the failure (what
incorrect behavior the system exhibits, what downstream effects that behavior has on other systems,
what hazards it creates for safe pod occupants), the detectability of the failure (whether the system's
built-in diagnostics detect the failure, whether external monitoring could detect it, whether the
occupants would notice it before it caused harm), the mitigations that exist (design changes,
operational procedures, monitoring systems, redundant components that could prevent the failure or
reduce its consequences), and the residual risk after mitigation (the probability and severity of the
failure occurring despite all feasible mitigations). This section is the safety case for the system —
the argument that all identified failure modes have been analyzed and mitigated to an acceptable level
of risk — and it is the document that a safety certification authority would review before approving
the system for use in an occupied safe pod. The archaeologist who cannot write this section with
confidence has not completed the archaeological process, regardless of how many other sections they have
written, because the purpose of archaeology is to enable the prediction and prevention of failures,
and an archaeological report that does not include a failure surface analysis is a report that has not
fulfilled its purpose.

**Section I: How to Fix It.** This section proposes specific changes to the system that would eliminate
or reduce the identified failure modes, with each proposal including: the exact change (code
modification, hardware modification, process modification, operational procedure modification), the
rationale for the change (why this change addresses the root cause rather than the symptom), the
verification that the change does not introduce new failure modes (a negative that can never be fully
proven but must be argued based on the completeness of the archaeologist's understanding of the
system), the impact of the change on the system's other behaviors (what the change breaks, what it
degrades, what it makes more complex, what it makes less maintainable), and the priority of the change
relative to other proposed changes (which fixes are safety-critical and must be implemented before the
system is deployed, which are important but can be deferred to a later revision, which are
nice-to-have improvements that should be recorded but not necessarily implemented). The safe pod
engineer's professional obligation is to propose fixes for every safety-critical failure mode, to argue
for their implementation with the urgency appropriate to the risk they mitigate, and to document in the
archaeological report any safety-critical fixes that were proposed but not implemented, with the
rationale for the non-implementation and the residual risk that the non-implementation leaves
unaddressed. A safety-critical fix that is proposed but not implemented is a known residual risk, and
the decision to accept that risk must be made by someone with the authority to accept risk on behalf of
the people who will be exposed to it — ultimately, the safe pod occupants, represented by the safety
certification authority — and the archaeologist's report must make clear that the risk exists and has
not been mitigated, so that the decision to accept it is an informed decision rather than an
unconscious one.

**Section J: How to Prevent Similar Failures in Future Systems.** This section abstracts from the
specific system to the class of systems to which it belongs, identifying the patterns in the system's
design that produced its failure modes and proposing process changes that would prevent similar
patterns from recurring in future designs. These recommendations may include: changes to the design
review process (requiring specific analyses that were not performed for this system), changes to the
testing strategy (requiring specific test categories that were not applied to this system), changes to
the documentation requirements (requiring specific information that was not captured for this system),
changes to the organizational structure (creating specific roles or responsibilities that were absent
during this system's development), changes to the toolchain (adopting specific tools that would have
caught errors that were missed by the tools used for this system), or changes to the regulatory
framework (proposing specific requirements that would have prevented this system's failures if they had
been in effect during its development). These recommendations are addressed to the organization that
will design the next system, not to the designers of the current system, and they represent the
archaeologist's contribution to the institutional learning that is the ultimate purpose of the
archaeological process — not just to fix the system under study but to improve the organization's
ability to build correct systems in the future. An organization that does not learn from its failures
is an organization that will repeat them, and the archaeological report is the mechanism by which
learning is captured, preserved, and transmitted to the people who will design the next system, who may
not have been present for the failures that the current system's designers experienced.

---

## 7. CASE STUDIES

The following case studies are drawn from the safe pod engineering domain and illustrate the
application of the complete archaeology protocol to real technical problems. They are presented in the
gonzo style: first-person, present-tense, with the archaeologist's reasoning visible at each step,
because the purpose of a case study is not to demonstrate that the archaeologist was correct but to
demonstrate how the archaeologist reached their conclusions, so that the reader can evaluate the method
rather than just the results.

**Case Study 1: The Braking Controller That Wouldn't Brake.** The incident: during integration testing
of the Mark III safe pod, the braking controller intermittently fails to respond to brake commands from
the vehicle control unit. The failure occurs approximately once per thousand brake events, always
during the transition from regenerative braking to friction braking, and always when the battery state
of charge is above 95%. The brake command is sent, the controller acknowledges receipt, and then
nothing happens — the brake actuator remains at zero force, the vehicle does not decelerate, and the
fallback emergency braking system activates two hundred milliseconds later, bringing the vehicle to a
halt but exceeding the specified response time for the primary braking system. The development team has
been debugging this issue for three weeks and has been unable to reproduce it reliably or identify the
root cause. I am called in as the archaeologist.

Phase A — Read the Datasheet: I obtain the braking controller's technical reference manual, all 847
pages of it, and I read every page. The controller is based on a Texas Instruments TMS570 safety
microcontroller, which has a dual-core lockstep architecture where both cores execute the same
instructions and their outputs are compared on every clock cycle; if the outputs ever differ, the
controller enters a fault state. The brake actuator is driven by a three-phase brushless DC motor
through an H-bridge, with current sensing on each phase and position feedback from a resolver. The
controller implements a nested control loop: an outer position loop that converts a commanded brake
force into a target motor position, an inner current loop that converts the target position into phase
currents, and a field-oriented control algorithm that converts the phase currents into PWM duty cycles
for the H-bridge. The transition from regenerative to friction braking involves switching the motor
from generator mode (where it produces current that charges the battery) to motor mode (where it
consumes current that produces torque), which requires reversing the current flow in the H-bridge and
synchronizing the PWM with the motor's back EMF. The datasheet section on regenerative-to-motoring
transition notes that "the transition requires a minimum dead time of 50 microseconds to prevent
shoot-through current in the H-bridge, and the dead time must be extended to 150 microseconds if the
battery voltage exceeds 42 volts." This footnote is on page 623, in a section titled "Advanced PWM
Configuration — Regenerative Braking Mode — Transition Sequencing," and it is not referenced anywhere
else in the document. The fact that this footnote is on page 623 of an 847-page document, in a section
that appears to be about advanced configuration options rather than about safety-critical behavior, is
itself archaeologically significant: it suggests that the document's authors did not consider the
dead-time requirement to be safety-critical, and therefore did not surface it prominently, and
therefore engineers reading the document for safety-critical information would be unlikely to find it.

Phase B — Read the Errata: I obtain the errata for the TMS570 revision used in the Mark III
controller. Erratum #47, titled "PWM Dead-Time Insertion May Be Skipped Under Specific Timing
Conditions," documents that "if the PWM timer is reloaded during the dead-time insertion period, the
dead-time counter may be reset, resulting in zero dead time for the current PWM cycle." The workaround
is "ensure that PWM timer reloads occur at least 200 microseconds before or after any dead-time
insertion period." The errata also notes that this issue "is present in silicon revisions A, B, and C
and is planned for fix in revision D," and the Mark III controller uses revision B. Erratum #47
directly contradicts the assumption encoded in the datasheet's dead-time specification: the datasheet
says the dead time will be 150 microseconds; the errata says the dead time may be zero microseconds if
the timer is reloaded at the wrong moment. The gap between the datasheet's promise and the errata's
correction is the gap between what the designers of the PWM driver believed and what the silicon
actually does, and bridging that gap is the archaeological task.

Phase C — Read the Source Code: I obtain the controller's firmware source code and trace the execution
path from the brake command handler. The brake command handler is an interrupt service routine
triggered by a CAN message from the vehicle control unit. It validates the command, updates the target
brake force variable, and sets a flag that the main control loop checks on each iteration. The main
control loop runs at 1 kHz, driven by a timer interrupt. On each iteration, it reads the current brake
force target, calculates the motor position target using a lookup table, reads the current motor
position from the resolver, calculates the position error, runs the position PID controller to produce
a current target, reads the phase currents, runs the current PI controller to produce voltage targets,
and calls the PWM update function. The PWM update function configures the PWM timer for the next cycle,
including the dead-time settings. The critical code path: the brake command handler sets a flag and
returns; the next timer interrupt invokes the main control loop; the main control loop determines that
a transition from regenerative to friction braking is required (because the brake force target has
changed sign); the main control loop calls pwm_configure_transition(), which calculates the required
dead time based on the current battery voltage — there it is, `if (battery_voltage > 42.0f) dead_time_ns
= 150; else dead_time_ns = 50;` — and writes the dead-time register; the main control loop then calls
pwm_reload_timer() which reloads the PWM timer with the new configuration; and the reload occurs while
the PWM timer is in the middle of a dead-time insertion period for the current cycle. The source code
directly implements the condition described in Erratum #47, without implementing the workaround. The
archaeological question is: why?

Phase D — Read the Commit History: The pwm_configure_transition() function was added in commit
7a3f2c1, whose message reads "add transition sequencing for regen-to-friction handoff — quick fix,
needs review, may race with timer reload." The commit was made at 11:47 PM on a Friday, by an engineer
who left the company two weeks later. The function has been modified three times since: once to fix a
different bug (commit 9b4d8e2, "fix sign error in dead time calculation"), once to add support for
revision C silicon (commit 2c1a5f9, "add workaround for TMS570 rev C errata #52"), and once to add the
battery voltage check (commit 5e8f3d7, "extend dead time at high battery voltage per TRM section
14.7.3"). None of these modifications addressed the race condition between the timer reload and the
dead-time insertion, because the comment about the race condition was in the commit message, not in the
code, and the subsequent engineers only read the code, not the commit history of every line. The
original engineer knew the race condition existed — they wrote "may race with timer reload" in the
commit message — but they left the company before they could fix it, and the knowledge of the race
condition left with them, preserved only in a commit message that nobody subsequently read. This is a
classic archaeological pattern: critical knowledge was captured but not transmitted, and the system's
subsequent evolution occurred in ignorance of that knowledge.

Phase E — Read the Mailing List Archives (or Equivalent): The TI E2E forum has a thread titled "TMS570
PWM dead-time insertion skipped during reload" with seventeen replies. The thread starts with an
engineer reporting the exact symptom described in Erratum #47, and the TI applications engineer's
response is "the workaround is documented in the errata — ensure timer reloads do not occur during
dead-time insertion periods." The original poster asks "how do I know when the dead-time insertion
period is occurring?" and the response is "you can monitor the PWM dead-time status flag in the PWM
status register." The original poster then asks "is there a way to synchronize the reload with the
dead-time insertion period automatically?" and the response is "no, this must be handled in software."
The thread ends there, seven years ago. The Mark III controller's firmware does not monitor the PWM
dead-time status flag, does not synchronize timer reloads with dead-time insertion periods, and does
not implement the errata workaround — because the engineer who wrote the PWM code didn't read the
errata, didn't read the E2E forum thread, and didn't know that the race condition existed, except for
the original engineer who wrote "may race with timer reload" in a commit message and then left the
company.

Phase F — Build the Mental Model: The system's behavior is now clear. Under normal conditions, the
regenerative-to-friction transition works correctly because the timer reload happens to occur outside
the dead-time insertion period most of the time. When the battery state of charge is above 95%, the
battery voltage is at its maximum (approximately 44 volts for the Mark III's lithium-iron-phosphate
pack), which triggers the extended dead-time path in pwm_configure_transition(), which increases the
dead-time from 50 to 150 microseconds. This longer dead-time window increases the probability that the
timer reload will occur during the dead-time insertion period, from approximately 2% (50 microseconds
out of a 1000-microsecond PWM cycle) to approximately 15% (150 microseconds out of a 1000-microsecond
PWM cycle). When the reload occurs during the dead-time insertion period, Erratum #47 triggers: the
dead-time counter is reset to zero, the H-bridge's high-side and low-side transistors are both turned
on simultaneously for a brief period, the resulting shoot-through current triggers the overcurrent
protection circuit, the overcurrent protection circuit disables the H-bridge outputs, and the brake
actuator receives zero current for that PWM cycle. The main control loop detects the overcurrent fault
on the next iteration, clears the fault, and resumes normal operation — but the brake force command for
that cycle was lost, and if the transition from regenerative to friction braking occurs during an
emergency stop, the lost cycle translates to a 1-millisecond delay in brake response, which accumulates
over multiple transition cycles to the observed 200-millisecond delay before the fallback system
activates. The mental model explains every observed symptom — the intermittency, the correlation with
high battery state of charge, the 200-millisecond delay, the overcurrent faults in the diagnostic log —
without contradiction, which means the model is probably correct.

Phase G — Test the Model: I instrument the controller to monitor the PWM dead-time status flag, the
timer reload timing, the battery voltage, and the overcurrent fault status. I run one thousand brake
events with the battery at various states of charge. At 95% state of charge and above, the dead-time
status flag is active during timer reload in 14.7% of transition events, and 100% of those events
trigger an overcurrent fault. At below 95% state of charge, the dead-time status flag is active during
timer reload in 2.1% of events, and 100% of those events trigger an overcurrent fault. The observed
failure rate matches the model's prediction within measurement error. The root cause is confirmed. The
model is correct.

Phase I — How to Fix It: The fix is to implement the errata workaround: before calling
pwm_reload_timer(), poll the PWM dead-time status flag until it indicates that the dead-time insertion
period is not active, then perform the reload. The polling loop must include a timeout (the dead-time
insertion period is at most 150 microseconds, so a timeout of 200 microseconds is safe) to prevent an
infinite loop if the status flag is stuck. Additionally, the fix should be generalized to apply to ALL
PWM timer reloads, not just the regenerative-to-friction transition, because any reload during a
dead-time insertion period will trigger the errata. The generalized fix: modify the PWM driver's
pwm_reload_timer() function to poll the dead-time status flag before performing the reload, with a
configurable timeout and an error return if the timeout expires. This fix requires approximately ten
lines of code, has zero impact on normal operation (the polling loop will almost never wait because the
reload almost never coincides with the dead-time period), and eliminates the failure mode entirely. The
fix is implemented, tested across ten thousand brake events at all states of charge with zero failures,
and deployed to the Mark III fleet.

Phase J — How to Prevent Similar Failures: Three process failures contributed to this incident. First,
the errata review process was inadequate: the TMS570 errata document was not systematically reviewed
against the firmware design, and Erratum #47 was not identified as relevant to the PWM driver. The
preventive measure: every component datasheet and errata document must be systematically reviewed
against the firmware design, with each erratum classified as "applicable," "not applicable," or
"requires further analysis," and the classification must be documented and reviewed. Second, the commit
message warning about the race condition was lost because the warning was in the commit message rather
than in the code. The preventive measure: code comments must document known risks, not just known
behavior, and code review must verify that warnings in commit messages are reflected in code comments
before the commit is merged. Third, the transition from regenerative to friction braking was not
identified as a safety-critical function, and therefore was not subjected to the rigorous testing that
safety-critical functions receive. The preventive measure: any function that can prevent the braking
system from responding to a brake command is safety-critical by definition, regardless of its position
in the control architecture, and must be identified as such in the system's hazard analysis. These
process changes are implemented in the development process for the Mark IV controller, and the PWM
driver for the Mark IV controller includes the generalized fix from the start. The Mark III incident
will not recur because the process that allowed it has been replaced, not just the code that caused it.

**Case Study 2: The Temperature Sensor That Read 20 Degrees Too High.** The incident: during
environmental qualification testing of the Mark III safe pod's battery management system, the battery
temperature sensor readings are consistently 20 degrees Celsius higher than the actual battery
temperature, as measured by calibrated thermocouples placed adjacent to the production sensors. The
error occurs only when the battery is discharging at high current (above 2C rate) and only after the
battery has been discharging for more than five minutes. At low discharge rates and during charging,
the sensor readings are accurate. The battery management system uses the temperature readings to limit
charge and discharge current, to control the battery thermal management system, and to estimate the
battery's state of health — all safety-critical functions, because lithium-iron-phosphate batteries can
enter thermal runaway if overheated, and the thermal management system's response depends on accurate
temperature data. The sensor supplier's application engineers have been unable to explain the error and
have suggested that the sensors may be defective, but replacing the sensors with units from a different
manufacturing lot does not resolve the issue. I am called in as the archaeologist.

Phase A — Read the Datasheet: The temperature sensor is a thermistor-based device in a stainless steel
probe housing, rated for -40 to +125 degrees Celsius, with a specified accuracy of ±0.5 degrees Celsius
over the range of -20 to +80 degrees and ±1.0 degrees Celsius outside that range. The datasheet
specifies that the sensor's thermal time constant is 15 seconds in still air and 3 seconds in stirred
oil, and that the sensor's self-heating effect produces a temperature rise of 0.02 degrees Celsius per
milliwatt of power dissipation. The sensor is powered by a 3.3-volt supply through a 10-kilohm pull-up
resistor, which results in a current through the thermistor of approximately 0.33 milliamps at 25
degrees Celsius (where the thermistor resistance is approximately 10 kilohms), producing a power
dissipation of approximately 1.1 milliwatts and a self-heating error of approximately 0.02 degrees
Celsius — negligible. The datasheet does not specify the sensor's behavior under high rates of
temperature change, nor does it specify whether the sensor's accuracy specification applies during
temperature transients or only at thermal equilibrium. The datasheet's section on mounting
recommendations states that "the sensor probe should be inserted into a blind hole in the battery
casing with thermal grease to ensure good thermal contact," and that "the sensor cable should be routed
away from high-current conductors to minimize electromagnetic interference." These are recommendations,
not requirements, and the distinction matters: a recommendation that is not followed may or may not
cause problems; a requirement that is not followed will cause problems, and the datasheet does not
specify which of its recommendations are effectively requirements.

Phase B — Read the Errata and Change History: The sensor manufacturer has not published errata for this
sensor model. However, the battery management system's design specification states that the temperature
sensors were originally specified as platinum RTD sensors with a different time constant and
self-heating characteristic, and were changed to the current thermistor sensors six months before
production because the RTD sensors had a twelve-month lead time and the thermistor sensors were
available from stock. The design change notice documents that the electrical interface was modified to
accommodate the different resistance-versus-temperature curve of the thermistor, but does not document
any analysis of the thermal behavior differences between the two sensor types. This is the first
archaeological red flag: a component substitution that was treated as an electrical change but not as a
thermal system change, in a system whose function is thermal measurement. The thermal behavior
differences between an RTD and a thermistor are significant — different time constants, different
self-heating characteristics, different thermal mass, different thermal resistance between the sensing
element and the probe housing — and the design change notice's silence on these differences suggests
that nobody analyzed them.

Phase C — Read the Source Code: The battery management system's temperature monitoring function reads
the voltage across the thermistor through a 12-bit ADC, converts the voltage to resistance using the
voltage divider equation, converts the resistance to temperature using the manufacturer's
resistance-versus-temperature lookup table (with linear interpolation between table entries), and
applies a first-order low-pass digital filter with a time constant of 2 seconds to smooth the readings.
The filtered temperature is then used by the charge/discharge current limiting function, the thermal
management control function, and the state-of-health estimation function. The filter time constant of 2
seconds was chosen based on the platinum RTD sensor's time constant of 5 seconds (the design document
states that "the filter time constant should be less than half the sensor time constant to avoid adding
significant phase lag to the temperature measurement"). But the sensor was changed from RTD to
thermistor, and the thermistor's time constant is 3 seconds in stirred oil — except that in the actual
installation, the sensor is mounted in a blind hole with thermal grease, and the thermal resistance
between the battery cell and the sensor probe through the thermal grease and the stainless steel
housing is significantly higher than the thermal resistance in the stirred oil test condition. The
effective time constant in the installed configuration is approximately 25 seconds, as determined by a
step-response test I perform by heating a battery cell and monitoring the sensor's response. The filter
time constant of 2 seconds is therefore less than one-tenth of the effective sensor time constant, not
less than half — and the aggressive filtering is amplifying the effect of a secondary thermal path that
would be negligible in a properly matched system because the filter is fast enough to track temperature
changes that the sensor itself cannot track, introducing measurement artifacts that the original RTD
design would not have produced because the RTD's faster time constant matched the filter's bandwidth.

Phase D — Read the Commit History and Engineering Change Orders: The sensor change from RTD to
thermistor was documented in Engineering Change Order ECO-2025-047, which states "change temperature
sensor from Pt100 RTD (Vishay PTS1206) to NTC thermistor (Murata NCP15XH103F03RC) due to supply chain
constraints. Electrical interface modified per attached schematic. Thermal performance to be verified
during qualification testing." The qualification testing was performed at low discharge rates (below
0.5C) because the high-rate discharge test equipment was unavailable during the qualification window,
and the test report notes that "temperature sensor accuracy at high discharge rates will be verified
during system-level environmental qualification." The system-level environmental qualification is the
test that revealed the 20-degree error, and it was performed after production had already begun — the
classic "we'll fix it later" that became "we have to fix it now" when the test results came in. The
deferral of high-rate testing is the second archaeological red flag: testing at the most stressful
operating condition was deferred to a later phase, and the later phase occurred after production had
started, which meant that any problem discovered would be a production problem rather than a
development problem, with all the cost and schedule pressure that implies.

Phase E — Reconstruct the Failure Mechanism: I build a thermal model of the sensor installation. The
thermistor is a resistive element that dissipates power equal to I²R, where I is the current through
the thermistor and R is the thermistor's resistance. At 25 degrees Celsius, R is approximately 10
kilohms and I is approximately 0.33 milliamps, producing a self-heating power of approximately 1.1
milliwatts. But at higher temperatures, the thermistor's resistance decreases (it's a negative
temperature coefficient device), which increases the current through the voltage divider, which
increases the self-heating power. At 60 degrees Celsius, the thermistor resistance is approximately 2.5
kilohms, the current is approximately 0.53 milliamps, and the self-heating power is approximately 0.7
milliwatts — actually lower than at 25 degrees because the resistance decreases faster than the current
increases. So self-heating alone cannot explain the 20-degree error; the self-heating contribution is
less than 0.02 degrees at all temperatures. The actual mechanism is thermal resistance between the
battery cell and the sensor element, interacting with a secondary heat source. The battery cell is the
primary heat source that the sensor is intended to measure. The secondary heat source is the battery
management system's own electronics — the ADC, the microcontroller, the power supply, the communication
transceivers — which are mounted on a printed circuit board approximately 5 centimeters from the sensor
connector. The sensor cable is a 22 AWG twisted pair with PVC insulation, and copper has a thermal
conductivity of approximately 400 W/(m·K), meaning that the sensor cable conducts heat from the warm
PCB to the sensor connector, and from the connector through the sensor housing to the thermistor
element. At low discharge rates, the PCB temperature is close to ambient, and this secondary heat path
is negligible. At high discharge rates, the battery current flows through the PCB's power supply
section (the battery management system is powered by the same battery it monitors), and the power
supply's voltage regulator dissipates approximately 2 watts of heat, raising the PCB temperature
approximately 15 degrees Celsius above ambient. This heat flows through the sensor cable to the sensor
connector, raising the connector temperature, and from the connector through the stainless steel
housing to the thermistor element, adding approximately 5 degrees Celsius of error. But the observed
error is 20 degrees, not 5. The remaining 15 degrees comes from the thermal resistance of the sensor
installation interacting with the battery's internal temperature gradient. At high discharge rates, the
battery cell's internal temperature is not uniform: the center of the cell, where the electrochemical
reaction is most active, is significantly hotter than the surface of the cell, where the temperature
sensor is mounted. The temperature gradient between the cell center and the cell surface is
approximately 15 degrees Celsius at a 2C discharge rate, as documented in the battery cell
manufacturer's thermal characterization report — a document that the battery management system's
designers did not read because it was published by the cell manufacturer, not the sensor manufacturer,
and their archaeology stopped at the component boundary. The sensor is measuring the cell surface
temperature, but the thermal management system and the charge/discharge limiting algorithms need the
cell center temperature, because thermal runaway begins at the cell center and propagates outward. The
20-degree error is the sum of two independent effects: a 5-degree error from PCB heat conduction
through the sensor cable (which could be reduced by using a sensor with a higher thermal resistance
between the connector and the element, or by thermally isolating the sensor connector from the PCB),
and a 15-degree error from the temperature gradient between the cell center and the cell surface (which
cannot be reduced by sensor selection because no surface-mounted sensor can measure the center
temperature of a cell with a 15-degree internal gradient). The mental model explains the observed error
magnitude, the correlation with discharge rate, the time delay before the error appears (the thermal
time constants of the PCB and the battery cell), and the fact that the error is consistent across
sensor replacements. The model is coherent and complete.

Phase I — How to Fix It: The sensor measurement error cannot be corrected by sensor selection or
installation improvement alone; it requires a software correction in the battery management system. The
correction must model the relationship between cell surface temperature and cell center temperature as
a function of discharge rate, state of charge, and battery age, and must apply this model to convert
the measured surface temperature to an estimated center temperature. The model can be derived from the
cell manufacturer's thermal characterization data (which provides the surface-to-center gradient as a
function of discharge rate), validated through instrumented tests with thermocouples embedded in the
cell center, and implemented as a lookup table or a fitted polynomial in the battery management
system's firmware. Additionally, the PCB heat conduction error can be eliminated by changing the sensor
to a digital sensor with an I²C or SPI interface (which eliminates the analog voltage divider and its
associated self-heating and noise susceptibility), locating the sensor's analog-to-digital conversion
at the sensor itself rather than at the PCB, and using a thermally isolated connector between the
sensor cable and the PCB. These changes are implemented in the Mark IV battery management system, and
the temperature measurement accuracy at high discharge rates improves from ±20 degrees Celsius to ±1
degree Celsius, which is within the ±0.5 degree specified accuracy of the sensor itself when the
system-level thermal effects are properly compensated.

Phase J — How to Prevent Similar Failures: The root cause of this incident was a component substitution
(RTD to thermistor) that was treated as an electrical interface change but not as a thermal system
change. The preventive measure: any component substitution in a measurement system must trigger a
complete re-analysis of the measurement system's behavior, including thermal effects, electromagnetic
compatibility, mechanical mounting, and calibration, because the substitution of a component with
different physical characteristics (time constant, self-heating, thermal resistance, noise
susceptibility, mechanical dimensions) can invalidate every aspect of the measurement system's design
that depended on the original component's characteristics. This principle is encoded in the engineering
change process for the Mark IV: any change to a component whose output is used for safety-critical
decisions must be accompanied by a systems engineering analysis that traces the component's
characteristics through every function that depends on its output, and this analysis must be reviewed
by an engineer who was not involved in the change. The second root cause was the deferral of high-rate
discharge testing to a later qualification phase, which allowed the measurement error to go undetected
until after production had begun. The preventive measure: the qualification test plan must include all
operating conditions that the system will encounter in service, and no test may be deferred to a later
phase without a documented risk assessment that is reviewed and approved by the safety engineering
team. These process changes prevent this specific class of failure in the Mark IV, and the underlying
principle — component substitution requires system-level re-analysis — is applicable to any
safety-critical system in any domain, from aviation to medical devices to nuclear power.

---

## 8. THE ARCHEOLOGIST'S CODE

The Archeologist's Code is the ethical framework that governs when and how the archeological protocol
is applied, because the protocol is expensive — it requires time, expertise, access to evidence that
may be difficult to obtain, and a willingness to follow the evidence wherever it leads regardless of
whether the conclusions are convenient — and the archaeologist who applies the protocol indiscriminately
will spend their career on the first system they encounter while the world moves on without them. The
Code defines three categories of archaeological engagement and the criteria for selecting among them,
and the archaeologist who cannot articulate which category applies to their current work and why is an
archaeologist who has not thought carefully enough about the consequences of their actions. The
categories are not arbitrary; they are derived from the ethical principle that the depth of
understanding must be proportional to the severity of the consequences of misunderstanding, and that
the archaeologist's professional obligation to achieve sufficient understanding increases with the
potential harm that insufficient understanding could cause.

**Category 1: Complete Archaeology Required.** This category applies when the consequences of incorrect
understanding include death, serious injury, significant property damage, environmental catastrophe, or
irreversible loss of critical capability — in other words, when the system is safety-critical,
security-critical, or mission-critical. For these systems, the complete archaeological protocol must be
executed in full, without shortcuts, without deferrals, without assumptions about what can be skipped.
The safe pod braking controller, the battery management system's thermal protection logic, the occupant
protection system's crash detection algorithm, the vehicle control unit's arbitration logic, the
emergency communication system's failover mechanism — every system whose failure could kill an occupant
requires complete archaeology. The engineer who applies partial archaeology to a safety-critical system
and whose incomplete understanding contributes to a fatality has committed professional negligence, and
the existence of schedule pressure, budget constraints, or management directives does not mitigate this
negligence — the engineer's professional obligation to protect public safety supersedes their obligation
to their employer, and the engineer who cannot fulfill both obligations simultaneously must escalate
the conflict, not resolve it by compromising safety. This is not a matter of opinion; it is the
explicit requirement of every engineering code of ethics and the implicit requirement of the social
contract that allows engineers to practice their profession. The engineer who says "I didn't have time
to do complete archaeology" after a fatality is making a confession, not an excuse, and the confession
is that they prioritized schedule over safety, which is the one prioritization that the engineering
profession exists to prevent. Category 1 archaeology is non-negotiable, and anyone who attempts to
negotiate it — who says "can't we just do the important parts and skip the rest?" — is demonstrating
that they do not understand the nature of safety-critical engineering, because in safety-critical
engineering, the part you skip is the part that kills someone.

**Category 2: Partial Archaeology Acceptable.** This category applies when the consequences of
incorrect understanding are limited to economic costs (schedule delays, budget overruns, rework, missed
opportunities) and when the expected cost of incomplete understanding, multiplied by the probability
that the incomplete understanding will lead to incorrect action, is less than the cost of complete
archaeology. For these systems, the archaeologist may execute a subset of the protocol — typically
Phases A through D (datasheet, errata, source code, commit history) plus targeted investigation of
specific questions raised by those phases — and may accept a level of residual uncertainty that would
be unacceptable for a safety-critical system. This is the normal mode of archaeological engagement for
most commercial software development: understanding a library before integrating it, understanding a
legacy module before modifying it, understanding a protocol before implementing it, understanding a
competitor's product before designing a response to it. The key judgment is the determination that the
system is not safety-critical — a determination that must be made explicitly, with awareness that
systems that are not currently safety-critical can become safety-critical if their context changes (a
library that was used only for internal tools becomes safety-critical when someone integrates it into
the braking controller's communication stack), and that the archaeologist who classified a system as
non-safety-critical bears responsibility for reevaluating that classification when the system's context
changes. The characteristic of Category 2 archaeology is that the archaeologist makes an explicit
decision about what to investigate and what to leave uninvestigated, documents that decision and its
rationale, and accepts the residual risk of being wrong about something they chose not to investigate.
This is professional judgment exercised within acceptable risk boundaries, and it is fundamentally
different from Category 3 because the archaeologist is making conscious choices based on risk
assessment rather than simply not doing the work.

**Category 3: Archaeology Not the Right Tool.** This category applies when the system under study is
not amenable to archaeological analysis because the necessary evidence is unavailable (the source code
is lost, the designers are dead, the documentation was never written, the hardware is no longer
manufactured and no examples survive), or because the cost of archaeology exceeds the value of
understanding (the system is trivial, the system will be replaced before incomplete understanding could
cause harm, the system's behavior is already understood at a level sufficient for all intended uses).
In these cases, the appropriate alternative to archaeology is not to proceed with incomplete
understanding but to acknowledge that understanding is not achievable and to manage the risk of
incorrect action through other means: operational restrictions that prevent the system from being used
in contexts where its unknown behaviors could cause harm, monitoring that detects incorrect behavior and
triggers a safe state before harm occurs, redundancy that allows the system to fail without causing
harm, or replacement of the system with one that is amenable to archaeological analysis. The
archeologist's code requires honesty about the limitations of archaeological knowledge: the
archaeologist who claims to understand a system that they have not fully investigated has violated the
code, and the archaeologist who allows others to believe they have performed complete archaeology when
they have performed only partial archaeology has also violated the code, because the social function of
the archaeological claim is to provide assurance that the system's behavior is understood, and false
assurance in a safety-critical context is indistinguishable from sabotage in its consequences. Category
3 is not a failure of the archaeological process; it is a recognition that some systems are not
amenable to archaeological analysis, and that the responsible course of action is to acknowledge this
limitation rather than to pretend it doesn't exist. The engineer who says "I don't understand this
system well enough to use it safely, so I won't use it" is demonstrating more professional integrity
than the engineer who says "I don't really understand this system, but it's probably fine."

The Archeologist's Code also governs the archaeologist's relationship with the system's original
creators. When the original creators are available for consultation, the archaeologist must engage
them, because the creators possess tacit knowledge that is not captured in any document — knowledge of
why certain approaches were tried and abandoned, knowledge of what the system's actual failure modes
are (as opposed to the failure modes that were documented in the bug tracker), knowledge of which parts
of the system are fragile and which are robust, knowledge of what the creators would do differently if
they could start over. This tacit knowledge is the most valuable artifact the archaeologist can
acquire, and the archaeologist who fails to seek it out because they believe they can reconstruct it
from documents alone is making the same error as the historian who believes that written records
capture everything important about a historical event. But the archaeologist must also approach the
creators' accounts with the same skepticism they apply to documentation: creators have imperfect
memories, creators have emotional investments in their decisions that distort their recollections,
creators have incentives to present their decisions as more rational than they actually were, and
creators may be unaware of aspects of the system's behavior that were discovered after the creators
stopped working on it. The creators' testimony is evidence, not truth, and it must be treated as
evidence — weighed against other evidence, tested against the artifacts themselves, and accepted only
when it is consistent with the totality of the archaeological record. The archaeologist who accepts the
creators' account uncritically is the archaeologist who will incorporate the creators' blind spots into
their own mental model, and will therefore be wrong in the same ways the creators were wrong, which
defeats the purpose of archaeology. The archaeologist who rejects the creators' account uncritically is
the archaeologist who will discard valuable information out of misplaced confidence in their own
ability to reconstruct everything from documents, and will therefore be wrong in new and different
ways, which is not an improvement. The correct approach is triangulation: use the creators' testimony
as one source of evidence among many, cross-reference it against the documentary and physical evidence,
identify discrepancies, investigate the discrepancies, and build a model that explains the
discrepancies rather than ignoring them. The creators say the system does X under condition Y; the test
data shows the system does Z under condition Y; the discrepancy is itself archaeological evidence, and
understanding why the creators believed X when the reality is Z reveals something about the creators'
mental model, the system's behavior, or both — and that something is often the key to understanding the
system at a deeper level than either the creators or the documents alone could provide.

---

## APPENDIX: THE KEYMAKER'S TAXONOMY OF SYSTEM UNDERSTANDING

The Keymaker's ontological framework provides the following taxonomy of system understanding, which is
used throughout the archaeological process to classify the archaeologist's knowledge and to identify
gaps. The taxonomy is hierarchical: each level subsumes the previous level, and progress through the
levels is unidirectional — you cannot reach Level 2 without passing through Level 1, and you cannot
reach Level 3 without passing through Level 2. The archaeologist's goal is to reach at least Level 2
for any system they intend to modify or depend upon, and Level 3 for any system they intend to design,
because designing a system without understanding the class of systems to which it belongs is
guesswork dressed in the language of engineering.

**Level 0 — Tourist.** The tourist can describe what the system does in normal operation, can operate
the system through its intended interface, and can recognize when the system is behaving abnormally,
but cannot explain why the system behaves as it does, cannot predict the system's behavior under
conditions they have not observed, and cannot modify the system without breaking it. The tourist's
knowledge is entirely empirical: they know what happens because they have seen it happen, not because
they understand the mechanisms that produce it. Most users of most systems are tourists, and this is
appropriate for their role — the operator of a safe pod does not need to understand the braking
controller's firmware to operate the safe pod safely — but the engineer who remains a tourist while
making engineering decisions about a system is a danger to themselves and others. The tourist who tries
to modify a system they don't understand is like a tourist who tries to repair an ancient fresco with a
pressure washer: the intention may be good, but the result will be destruction, and the tourist will
not understand why until it is too late. The safe pod engineer who reads the braking controller's user
manual and thinks they understand it well enough to modify it is a tourist who has mistaken familiarity
for understanding, and the safe pod that results from their modifications will kill someone.

**Level 1 — Tourist with a Map.** The tourist with a map can describe the system's architecture in
terms of its documented components and interfaces, can navigate the system's documentation to find
information about specific behaviors, and can make simple modifications to the system by following
documented procedures. But the tourist with a map cannot reconstruct the system's design logic, cannot
predict the consequences of modifications that cross component boundaries, and cannot distinguish
between documented behavior that is accurate and documented behavior that is aspirational. The tourist
with a map is the engineer who has read the architecture document and believes they understand the
system — and who will be surprised when the system's behavior deviates from the architecture document's
description, because they have confused the map with the territory. Most software engineers operating
in non-safety-critical contexts operate at Level 1: they read the API documentation, they understand
the component interfaces, they can make changes within a component, and they rely on integration tests
to catch problems that cross component boundaries. This is acceptable when the consequences of failure
are a bug report and a patch rather than a fatality and a funeral. It is not acceptable for
safety-critical systems, where the gap between the map and the territory is measured in human lives.
The Level 1 engineer who is promoted to work on a safety-critical system without being trained to reach
Level 2 is being set up for failure by an organization that does not understand the difference between
the two levels — and the engineer who accepts the promotion without acquiring the skills to reach Level
2 is complicit in that failure.

**Level 2 — Archaeologist.** The archaeologist can reconstruct the system's design logic from the
available evidence, can predict the system's behavior under any condition they can imagine, can trace
any observed behavior to its root cause in the system's implementation, can distinguish between intended
behavior and unintended behavior, can identify the assumptions that the system's designers made and the
conditions under which those assumptions fail, and can modify the system in ways that are consistent
with its design logic and that do not introduce new failure modes. The archaeologist's knowledge is
structural rather than empirical: they understand the system's mechanisms, not just its symptoms, and
can therefore reason about the system's behavior in contexts they have never observed. This is the
minimum acceptable level of understanding for anyone making engineering decisions about a
safety-critical system, because a safety-critical system will encounter conditions that its designers
never tested, and the engineer who cannot predict the system's behavior under untested conditions cannot
ensure that the behavior will be safe. The archaeologist achieves Level 2 understanding through the
complete archaeological protocol described in this ability, and maintains it through continuous
engagement with the system — reading new commits, monitoring new bug reports, participating in the
system's community, and updating their mental model as the system evolves. Level 2 understanding is not
a permanent achievement; it is a state that must be actively maintained, because the system changes
over time, and the archaeologist who achieved Level 2 understanding of a system five years ago and has
not re-engaged with it since is no longer an archaeologist with respect to that system — they are a
tourist with an outdated map, which is more dangerous than a tourist with no map because the outdated
map provides false confidence.

**Level 3 — Creator.** The creator can design a system from first principles, starting with a set of
requirements and constraints, and produce a design whose behavior is predictable and whose failure
modes are understood before the system is built. The creator possesses the knowledge that the
archaeologist reconstructs after the fact — knowledge of why every decision was made, why every
alternative was rejected, what assumptions the design depends on, and what conditions will cause those
assumptions to fail. The creator who is also an archaeologist (who has studied the systems that came
before and understands their design logic) is the creator who avoids repeating the mistakes of the past
— not because they have memorized a list of mistakes to avoid, but because they understand the
mechanisms by which those mistakes were produced, and can recognize when they are about to make an
analogous mistake in a new context. This is the level that the safe pod engineering team must operate
at, because the safe pod is a new category of vehicle for which there is no established body of design
patterns, and every design decision must be made from first principles with full awareness of its
consequences. The creator who operates without archaeological knowledge — who designs in ignorance of
the systems that have attempted similar things and failed — is the creator who will repeat those
failures, not because they are incompetent but because they are ignorant, and ignorance is curable
through archaeology. The creator who refuses to do archaeology — who believes that their intuition is
superior to the accumulated experience of previous systems — is the creator who will produce a system
whose failure modes are the same failure modes that previous systems discovered and fixed, and whose
occupants will pay the price for the creator's arrogance.

---

*This ability is the intellectual foundation of all other KEYMAKER abilities. The archeological
mindset — assume intelligence, reconstruct constraints, test relentlessly, refine continuously,
document honestly — is the methodology by which the KEYMAKER agent approaches every technical problem,
regardless of domain. An agent that can perform complete source code archaeology on any system can
understand any system, and an agent that can understand any system can solve any problem that is
solvable within the constraints of physics, information, and time. The remaining abilities in the
KEYMAKER catalog are applications of this foundational ability to specific problem domains encountered
in safe pod engineering — each ability assumes the archaeological mindset and applies it to a specific
class of problems, but the mindset itself is the common thread that connects them all. The Keymaker's
role in the Matrix was to create keys that could open any door; the KEYMAKER agent's role in safe pod
engineering is to create understanding that can unlock any system. This ability is the key-making
process.*

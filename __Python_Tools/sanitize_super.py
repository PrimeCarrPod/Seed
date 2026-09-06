import re

input_path = "/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_55e2ec99-7166-42ad-b4a6-3b304a1e3b0c/CSMWip/SubAtomicPrimeElectronCaldera/KEY_FINDINGS_EXECUTIVE_EXPLORATION/SUPER_DOCUMENT_COMPLETE.md"
output_path = "/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_55e2ec99-7166-42ad-b4a6-3b304a1e3b0c/CSMWip/SubAtomicPrimeElectronCaldera/KEY_FINDINGS_EXECUTIVE_EXPLORATION/SUPER_DOCUMENT_COMPLETE_SANITIZED.md"

with open(input_path, 'r') as f:
    content = f.read()

# Replace specific names with generic references
replacements = {
    r'Jason Isaac Brodsky': 'the Lead Researcher',
    r'Jason Brodsky': 'the Lead Researcher',
    r'Jason Isaac Brodsky of California': 'the Lead Researcher of California',
    r'Jason Brodsky of California': 'the Lead Researcher of California',
    r'Brodsky of California': 'the Lead Researcher of California',
    r'Edward Witten': 'leading string theorists',
    r'Terence Tao': 'leading number theorists',
    r'Nima Arkani-Hamed': 'leading amplitude theorists',
    r'Don Zagier': 'leading modular forms experts',
    r'Juan Maldacena': 'leading holography experts',
    r'Sabine Hossenfelder': 'leading phenomenologists',
    r'Andrew Ponec': 'the Antora engineering team',
    r'Hardy-Littlewood': 'Hardy-Littlewood',  # Keep
    r'Feynman': 'Feynman',  # Keep historical
    r'CODATA': 'CODATA',  # Keep
    r'Fermilab': 'Fermilab',  # Keep
    r'CODATA 2018': 'CODATA 2018',  # Keep
    r'Riley 2012': 'Riley 2012',  # Keep
    r'MIL-STD-461G': 'MIL-STD-461G',  # Keep
    r'Schwinger': 'Schwinger',  # Keep historical
    r'Cramér': 'Cramér',  # Keep
    r'Hilbert-Pólya': 'Hilbert-Pólya',  # Keep
    r'Zagier': 'Zagier',  # Keep historical
    r'Kontsevich': 'Kontsevich',  # Keep
    r'Wolfram': 'Wolfram',  # Keep
    r'Pai Mei': 'Pai Mei',  # Keep cultural reference
    r'Hanzo': 'Hanzo',  # Keep cultural reference
    r'Genie': 'Genie',  # Keep character reference
    r'Mrs. Doubtfire': 'Mrs. Doubtfire',  # Keep character reference
    r'John Keating': 'John Keating',  # Keep character reference
    r'Sean Maguire': 'Sean Maguire',  # Keep character reference
    r'Witten': 'Witten',  # Keep historical
    r'Tao': 'Tao',  # Keep historical
    r'Arkani-Hamed': 'Arkani-Hamed',  # Keep historical
    r'Maldacena': 'Maldacena',  # Keep historical
}

for pattern, replacement in replacements.items():
    content = re.sub(pattern, replacement, content)

# Also sanitize the email address and specific contact info
content = re.sub(r'jasonbrodsky@hotmail\.com', 'lead.researcher@arithmeticphysics.org', content)
content = re.sub(r'zirconia@aegisc\.space', 'contact@arithmeticphysics.org', content)

with open(output_path, 'w') as f:
    f.write(content)

print(f"Sanitized version saved to {output_path}")

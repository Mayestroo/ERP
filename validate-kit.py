from pathlib import Path
import csv,json, re
root=Path(__file__).resolve().parent
expected={'03_PROCESS_CATALOG.csv':40,'05_DATA_DICTIONARY.csv':40,'06_ERPNext_MAPPING.csv':20,'17_UX_SCREEN_CATALOG.csv':26,'18_TEST_SCENARIOS.csv':30}
errors=[]
for name,minimum in expected.items():
    with (root/name).open(encoding='utf-8-sig',newline='') as f:
        data=list(csv.DictReader(f))
    print(f'{name}: {len(data)} records (min {minimum})')
    if len(data)<minimum: errors.append(name)
for p in root.rglob('*.json'):
    try: json.loads(p.read_text(encoding='utf-8'))
    except Exception as e: errors.append(f'{p}: {e}')
required=['AGENTS.md','MASTER_PROMPT.md','TASKS.md','QUALITY_GATES.md','start-phase.ps1','start-night.ps1','reference/v0.1.md','reference/v0.2.md','reference/v0.3.md','reference/v0.4.md']
for name in required:
    if not (root/name).exists(): errors.append('missing '+name)
tasktext=(root/'TASKS.md').read_text(encoding='utf-8')
n=len(re.findall(r'^- \[ \] T\d{3}',tasktext,re.M))
print(f'TASKS: {n}')
if n<60: errors.append(f'insufficient tasks {n}')
if errors:
    print('FAILED:',*errors,sep='\n- '); raise SystemExit(1)
print('KIT VALID: syntactic and inventory check (NOT an ERP runtime test).')

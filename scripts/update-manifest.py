#!/usr/bin/env python3
"""Update the memory manifest file.
Run after adding/removing knowledge files.
Can be called from consolidation or manually.
"""

import os
import re

BASE = '/Users/ghayyathhuzayen/VS-workspace/claude-mind/memory'
MANIFEST = os.path.join(BASE, 'manifest.md')

def get_knowledge_files():
    kdir = os.path.join(BASE, 'knowledge')
    files = []
    for f in sorted(os.listdir(kdir)):
        if not f.endswith('.md') or os.path.isdir(os.path.join(kdir, f)):
            continue
        fpath = os.path.join(kdir, f)
        with open(fpath) as fh:
            content = fh.read()
        # Get title
        title = f.replace('.md', '')
        for line in content.split('\n'):
            if line.startswith('# '):
                title = line[2:].strip()
                break
        files.append({'file': f, 'title': title})
    return files

def get_theme_files():
    tdir = os.path.join(BASE, 'semantic/themes')
    if not os.path.exists(tdir):
        return []
    return [f for f in sorted(os.listdir(tdir)) if f.endswith('.md') and f != 'index.md']

def get_entity_files():
    edir = os.path.join(BASE, 'semantic/entities')
    if not os.path.exists(edir):
        return []
    return [f for f in sorted(os.listdir(edir)) if f.endswith('.md') and f != 'index.md']

if __name__ == '__main__':
    kfiles = get_knowledge_files()
    themes = get_theme_files()
    entities = get_entity_files()
    
    print(f'Knowledge files: {len(kfiles)}')
    print(f'Theme files: {len(themes)}')
    print(f'Entity files: {len(entities)}')
    print(f'\nManifest needs manual keyword updates for new files.')
    print(f'Existing files in manifest should be verified against this list.')
    
    # List any knowledge files not in manifest
    with open(MANIFEST) as f:
        manifest_content = f.read()
    
    missing = []
    for kf in kfiles:
        if kf['file'] not in manifest_content:
            missing.append(kf)
    
    if missing:
        print(f'\n\u26a0\ufe0f  {len(missing)} knowledge files NOT in manifest:')
        for m in missing:
            print(f"  - {m['file']} ({m['title']})")
        print('\nAdd these to manifest.md manually with appropriate trigger keywords.')
    else:
        print('\n\u2705 All knowledge files are in the manifest.')

# -*- coding: utf-8 -*-
"""Synkar updates.txt (Included Files i GameMaker-projektet) med projektfilen och GitHub-sidans README.
 1. Uppdaterar <size> for updates.txt i gms/Bratwurst.gmx/Bratwurst.project.gmx (och lagger in datafile-posten om den saknas).
 2. Skriver om blocket mellan <!-- UPDATES:START --> och <!-- UPDATES:END --> i README.md ("What's new" pa GitHub-sidan).
Format i updates.txt: rubrikrad '== UPDATE n - datum - titel ==' och punktrader '* text'. Nyast forst.
Kor efter varje andring av updates.txt: python tools/sync_updates.py"""
import io
import os
import re

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
TXT = os.path.join(ROOT, "gms", "Bratwurst.gmx", "datafiles", "updates.txt")
PROJ = os.path.join(ROOT, "gms", "Bratwurst.gmx", "Bratwurst.project.gmx")
README = os.path.join(ROOT, "README.md")
S, E = "<!-- UPDATES:START -->", "<!-- UPDATES:END -->"

ENTRY = """    <datafile>
      <name>updates.txt</name>
      <exists>-1</exists>
      <size>%d</size>
      <exportAction>2</exportAction>
      <exportDir></exportDir>
      <overwrite>0</overwrite>
      <freeData>-1</freeData>
      <removeEnd>0</removeEnd>
      <store>0</store>
      <ConfigOptions>
        <Config name="Default">
          <CopyToMask>9223372036854775807</CopyToMask>
        </Config>
      </ConfigOptions>
      <filename>updates.txt</filename>
    </datafile>
"""


def sync_project():
    size = os.path.getsize(TXT)
    raw = io.open(PROJ, "rb").read().decode("utf8")
    nl = "\r\n" if "\r\n" in raw else "\n"
    entry = (ENTRY % size).replace("\n", nl)
    if "<name>updates.txt</name>" in raw:
        raw = re.sub(r"<name>updates\.txt</name>(\s*)<exists>-1</exists>(\s*)<size>\d+</size>", lambda m: "<name>updates.txt</name>%s<exists>-1</exists>%s<size>%d</size>" % (m.group(1), m.group(2), size), raw)
    else:
        block = '  <datafiles number="1" name="datafiles">' + nl + entry + "  </datafiles>" + nl
        raw = raw.replace("  </Configs>" + nl, "  </Configs>" + nl + block, 1)
    io.open(PROJ, "wb").write(raw.encode("utf8"))
    print("projektfilen: updates.txt = %d byte" % size)


def to_markdown():
    out = []
    for line in io.open(TXT, encoding="utf8").read().splitlines():
        m = re.match(r"^==\s*(.*?)\s*==\s*$", line)
        if m:
            out.append("")
            out.append("### " + m.group(1))
            out.append("")
        elif line.startswith("* "):
            out.append("- " + line[2:])
    return "\n".join(out).strip() + "\n"


def sync_readme():
    t = io.open(README, encoding="utf8", newline="").read()
    nl = "\r\n" if "\r\n" in t else "\n"
    a, b = t.index(S), t.index(E)
    body = to_markdown().replace("\n", nl)
    t = t[:a + len(S)] + nl + nl + body + nl + t[b:]
    io.open(README, "w", encoding="utf8", newline="").write(t)
    print("README.md uppdaterad")


if __name__ == "__main__":
    sync_project()
    sync_readme()

# How to Move an LTER IMC working group to Github

## Background
Material from an active working groups should be moved to an area where collaborative work can 
continue. Git repositories have several advantages:

1. many IMC working groups have project material that is in Git already, and was linked to im.lternet.edu
1. access and collaborations can be managed via github teams
1. notes and other files can be kept in git in addition to code, so all project material can be kept together
1. to-do lists can be recorded as "Issues", and assigned to team members
1. websites are easily created using github pages
1. Git is already the standard platform for the coding community

## Goals

1. Material remains public (new material not added to im.lternet.edu)
1. IMC WG has a presence in the general LTER WG area

## Steps

Process for a WG to move their materials. 
This should be coordinated by the WG chair, or other knowledgable volunteer.

1. Decide if WG will be managed by LTER or EDI orgainzation (or some other) [link to decision tree here]
1. Examine LTER (or EDI) org in github for existing repo
1. Create a repostitory using a template (may require an admin) [template link here]
1. Mark the section at im.lternet.edu as "MOVED TO GIT, contact [chair name here]" (see bottom of page for code block example)
1. Move WG materials  
    1. Recommended repository sections. These will appear as directories in a local clone, and in the github.com 
view, under the under the tab labled "<> Code":
        1. README.md - every dir should have a readme. At the top level, use the readme to describe the basic 
goal and membership of the WG
        1. /docs/ - this is the default dir for github-pages 
        1. /meetings/ - agendas, notes 
        1. /products/ - lists or links to external products, e.g., papers, blog posts 
        1. /community-updates/  - ppts or outlines of presentations
   1. Optional sections (see othere repos for examples)
        1. code dirs may be partially dictated by the language; language documentation should include instructions.
            1. R 
            1. generic code dirs could be called /code/, or /scripts/ 
        1. /archive/ - for historical material 
        1. /practices/ - for the group's own guidelines (could be under /docs/)
3. Coordinate with NCO
    1. Find the working group landing page; consolidate if necessary
    1. assemble for landing page:
        1. abstract
        1. link to  git or svn
   
## Examples
### HTML block 
Below is an example notice stating that this material is being moved. Be sure that the "input format" is set to "full HTML". The default is filtered HTML, and span tag won't work. Drupal should respect the newlines in this block.

```
<span style="color:red;font-weight:bold">THIS WG's material has MOVED TO GIT. 
See https://github.com/lter/IMC_WG_wired
contact Suzanne, Margaret or Marty</span>
```

### In progress
#### EML Best Practices
1. Where: to EDI, as this is an ongoing project, [dm-best-practices](https://github.com/EDIorg/dm-best-practices). See folder: EML-BP-doc/archive/LTER-IMC-WG-material/WG_archive_BP/
2. Still to do: 
    - determine what NCO needs, send it to them.
#### EML Congruence Checker
1. Where: to EDI, as this is an ongoing project and part of PASTA, [ECC](https://github.com/EDIorg/ECC). See folder: archive/wg_history
2. Still to do: 
    - archive meeting notes, reports
    - determine what NCO needs, send it to them

### Finished 
Please inform the wired group when you are finished, and they will add your example to this list.


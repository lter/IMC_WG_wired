# How to Move an LTER IMC working group to Github

## Background
Material from an active working groups should be moved to an area where collaborative work can 
continue. Git repositories have several advantages:

1. many IMC working groups have project material that is in Git already, and was linked to im.lternet.edu
1. access and collaborations can be managed via github teams
1. notes and other files can be kept in git in addition to code, so all project material can be kept together
1. to-to lists can be recorded as "Issues", and assigned to team members
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
1. Mark the section at im.lternet.edu as "MOVED TO GIT, contact [chair name here]" 
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
   
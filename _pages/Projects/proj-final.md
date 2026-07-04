---
layout: assignment
permalink: /Projects/Final
title: "CS274: Computer Architecture - Final Project"


info:
  coursenum: CS274
  points: 100
  goals:
    - To demonstrate the fundamental concepts of computer architecture in a unified project
    - To work effectively as a member of a small group using collaborative tools for software development
  rubric:
    - weight: 40
      description: Algorithm Implementation
      preemerging: The circuit, microcontroller program, or VHDL simulation does not perform the task proposed and approved in the project proposal, or cannot be demonstrated or simulated at all
      beginning: The system performs the proposed task in a demonstration or simulation, but fails on one or more of its intended cases due to a minor issue (for example, a miswired signal, an incorrect control input, or a timing issue in the simulation)
      progressing: The system correctly performs the proposed task as demonstrated or simulated, but only for a narrow fixed case, or version control history (or initialed code sections) does not show meaningful check-ins from every team member
      proficient: The system correctly performs the proposed task in the general cases described in the proposal, is demonstrated working (live, recorded, or in simulation), and the version control history (or commented code sections) shows meaningful contributions checked in by every team member
    - weight: 20
      description: Protocol Description
      preemerging: Neither the components of the design nor how information flows between them (signals, buses, register transfers, or messages) is described at a level of detail adequate to comprehend how the system operates
      beginning: Either the components (units of the circuit, program, or VHDL entities) or the flow of information between them is described adequately, but not both
      progressing: The writeup describes both the components and the flow of information between them (for example, the control and data signals between units, or the message exchanges with the microcontroller) at an adequate level of detail to comprehend the system's operation
      proficient: The writeup describes the components and the flow of information between them precisely enough that a classmate could rebuild the system from the tutorial alone, including pin/signal assignments or entity interfaces, the sequence of operations, and a diagram of the design
    - weight: 20
      description: Code Quality and Documentation
      preemerging: Code (or VHDL) commenting and structure are absent, the circuit or design has no labeling or schematic, and/or the work departs significantly from the style guide
      beginning: Comments and labeling are sparse or restate the statements themselves, and/or there are minor departures from the style guide that reduce the readability of the code, VHDL, or schematic
      progressing: The code or VHDL is organized into functions, modules, or entities with comments describing what each does, and mostly adheres to the style guide, but comments restate definitions rather than explaining the design decisions
      proficient: The code or VHDL is organized into well-named functions, modules, or entities, comments explain the architectural role of each part (what hardware behavior it implements and why), the schematic or wiring is labeled, and the work follows the style guide
    - weight: 10
      description: Presentation and Participation
      preemerging: No presentation was provided, the presentation could not be viewed, or the presentation was not on the subject of the final project; one or more students did not participate in the project and the matter was not addressed by the team to the instructor
      beginning: A presentation was provided that summarizes the project, but does not provide a demo of the working system or discuss broader impacts; each student participated in a meaningful way
      progressing: A presentation was provided that summarizes the project, provides a demo (live, recorded, or simulated), and discusses broader impacts; all students participated in either the project or the presentation
      proficient: A presentation was provided that summarizes the project, provides a demo, discusses broader impacts, and highlights the challenges the team overcame and how the group organized its development; every student had a speaking role and contributed to both the project and the presentation
    - weight: 10
      description: Writeup and Submission
      preemerging: An incomplete submission is provided; the tutorial writeup is missing
      beginning: The project is submitted, but not according to the directions in one or more ways (for example, the tutorial writeup is missing, or code and design files are not included)
      progressing: The project is submitted according to the directions with a minor omission or correction needed, and the tutorial writeup would allow a classmate to follow the design with some effort
      proficient: The project is submitted according to the directions, including a tutorial-style writeup with the parts/tools used, the schematic or design files, step-by-step reproduction instructions, and a description of the solution that a classmate could follow to rebuild it

tags:
  - project
  
---

### Purpose

This project is your opportunity to unify the concepts of the course -- digital logic, datapaths, memory, and control -- in a hardware or hardware-simulation artifact of your own design.  Along the way you will practice the collaborative skills of real systems work: proposing a design, dividing responsibilities, coordinating through version control, and presenting your work as a reproducible tutorial.

### Task

In this project, you will propose a topic of your choosing and a group of at least 2 and up to 3 total members.  The project must be approved by the instructor before it may commence, but the topic is entirely up to you.  Multidisciplinary projects with a broader impact are encouraged, and you are welcome to collaborate with a stakeholder outside the department for inspiration on potential projects (this person is not to contribute code, only disciplinary context).

You may use git or another version control system to coordinate between your team.  **Each student shall contribute by checking in meaningful contributions to the project on the version control system.  If a version control system is not used, code sections should be commented with the initials or recognized pseudonym of the student.**

Using a breadboard, microcontroller (for example, Arduino), or the VHDL hardware simulation language, you will design a circuit to accomplish a particular task, and then write up and present your project to the class in the form of a tutorial that they could reproduce.

Example projects include:

* A breadboard CPU
* An Arduino-based memory or register unit to support a small CPU
* An adder circuit on a breadboard 
* A CPU simulated in the VHDL language

Finally, prepare as a team a project presentation that you will present live to the class for final presentations.  **Each student must have a speaking role** at the presentation.

## Group Formation

To form a group, students should draft a text document including the names of all students in the group, a summary of the proposed project, and a breakdown of each student's responsibilities on the team.  **Each student** should send this identical document to me for approval via e-mail.  I will respond via e-mail to the **entire** group notifying them that the project has been approved, and which members are on the team.  If I add or remove members from the team, I will notify the entire group via e-mail.  This shall constitute agreement of the project responsibilities by all members of the team.

Students who do not submit the proposal document described above (even if they are named in another group's proposal) within 3 days of the project hand-out date will be assigned to a group and notified via e-mail.

Should a member of the team fail to participate to the standards set in the proposal document described above, one or more members of the group shall notify that student via e-mail of specific tasks from the proposal document that have been agreed to, along with a deadline to communicate with the group (copy me on the e-mail message).  If the student does not respond within 2 days of that message, the group should notify me via e-mail, and I will investigate and, if appropriate, I may re-organize the team by moving one or more members to other groups (whom I will notify via e-mail), or by removing the student from the group (whom I will notify via e-mail).  
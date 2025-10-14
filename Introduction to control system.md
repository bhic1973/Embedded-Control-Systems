A control system consists of interconnected components aimed at achieving a specific purpose. This introduction discusses open-loop and closed-loop feedback control systems. We will outline a design process that involves setting goals, identifying controlled variables, defining specifications, and conducting modeling and analysis. This iterative approach helps us address design gaps while balancing complexity, performance, and cost. 

# Desired outcomes
Upon the completion of this introductory part of this course, you should be able to:

+ [ ] Give illustrative examples of control systems and describe their relationship to key contemporary issues.

+ [ ] Predict the future of controls in the context of their role in society.

+ [ ] Recognize the elements of control system design and possess an appreciation of appreciate controls in the context of engineering design.

# 1. Introduction 
Engineers develop products and services that enhance our daily lives by understanding, modeling, and controlling natural materials and forces. A key area of this work is *control system engineering*, which focuses on managing *systems*`(interconnected elements designed for specific purposes)`. Systems can range from simple automobile cruise control to complex brain-computer interfaces. 

Control engineering involves designing and implementing systems using *linear, time-invariant* mathematical models to represent real-world process and plants, often *nonlinear and time-varying* affected by *parameter uncertainties* and *external disturbances*. 

Control engineers face the challenge of creating simple yet accurate models for complex systems. With advancements in technology and access to affordable computers, sensors, and actuators, the implementation processes are becoming more automated. 

This field emphasizes modeling diverse physical systems and designing controllers to achieve desired performance characteristics, including stability, steady-state error tracking, transient response, disturbance rejection, and robustness against uncertainties. Key design elements include PID controllers, lead and lag controllers, and state variable feedback controllers.

Control system engineering is rooted in feedback theory and linear system analysis, incorporating elements from network and communication theory. While it has a strong mathematical foundation, it is practical and affects our daily lives. This field applies to various disciplines, including aerospace, biomedical, chemical, civil, electrical, mechanical, and computer engineering, as well as computer science. Additionally, many aspects of control engineering are relevant to systems engineering.

A control system is an interconnection of components forming a system configuration that will provide a desired system response. The basis for analysis of a system is the foundation provided by linear system theory, which assumes a cause–effect relationship for the components of a system. A plant, or process, to be controlled can be represented graphically, as shown in the figure below:

![[diag59.svg]]

­The input–­output relationship represents the cause-and-effect relationship of the plant, which in turn represents a processing of the input signal to provide a desired output signal.


![[diag60.svg]]


> ==**An open-loop control system utilizes an actuating device to control the plant directly without using feedback effect.**== 

A closed-loop control system differs from an open-loop system by utilizing a feedback mechanism to measure the actual output and compare it to the desired output. This measurement, known as the feedback signal, is essential for maintaining the relationship between system variables. A basic closed-loop feedback control system, shown below:
![[diag61.svg]]

adjusts control actions based on the difference between measured and desired outputs. With an accurate sensor, the measured output closely approximates the actual output.

> ==**A closed-loop control system uses a measurement of the output and feedback of this signal to compare it with the desired output (reference or command).**==

A closed-loop control system offers several advantages over an open-loop control system, particularly the capability to reject external disturbances and enhance the attenuation of measurement noise. In our block diagram, we represent disturbances and measurement noise as external inputs, as shown here:
![[diag62.svg]]

Since external disturbances and measurement noise are unavoidable in real-world applications, it is essential to consider them in practical control system designs.

# 2. Examples of control systems
Control engineering is concerned with the analysis and design of goal-oriented systems. Therefore the mechanization of goal-oriented policies has grown into a hierarchy of goal-oriented control systems. Modern control theory is concerned with systems that have self-organizing, adaptive, robust, learning, and optimum qualities.

## 2.1 Automated vehicles
Driving a car is more enjoyable when the vehicle responds quickly to the driver's commands. The era of autonomous vehicles is nearly here. These vehicles must sense their environment, plan trajectories, and manage control inputs like steering, acceleration, and braking effectively. A basic block diagram illustrates the steering control system. The desired course is compared to the actual course to generate an error signal, obtained through visual and tactile feedback via the steering wheel. 

---
![[diag64.svg]]

![[diag63.svg]]

+ Typical direction-of-travel response:
![[diag65.svg]]
 
## 2.2 Humanoid robot
A robot is a computer-controlled machine that involves technology closely related to automation. Industrial robotics refers to a specific area of automation where machines (robots) are designed to replace human labor. Therefore, robots possess certain human-like characteristics.

Today, the most common human-like feature is a mechanical manipulator, which is somewhat modeled after the human arm and wrist. Some devices even incorporate anthropomorphic mechanisms, resembling mechanical arms, wrists, and hands. An example of an anthropomorphic robot is illustrated below:

![[diag66.svg]]

It is important to recognize that automatic machines are well-suited for certain tasks, as shown in this table, while other tasks are best performed by humans.

| Tasks Difficult for a machine                | Tasks difficult for a human                        |
| :------------------------------------------- | -------------------------------------------------- |
| Displaying real emotions                     | Operating in toxic environments                    |
| Acting based on ethical principles<br>       | Highly repetitive activities                       |
| Precise coordination with other robots       | Deep underwater surveys                            |
| Anticipating human actions and responses<br> | Outer planet space exploration                     |
| Acquiring new skills on its own              | Working diligently with no breaks for long periods |

## 2.3 Biomedical engineering
Control system theory has several applications in biomedical fields, including experimentation, diagnosis, prosthetics, and biological control systems, affecting everything from cellular functions to the central nervous system. Most physiological control systems are closed-loop systems with multiple nested control loops. 

Prosthetic devices currently assist millions of people, and recent advances in feedback technology have significantly improved the lives of amputees and individuals with paralysis. Notable progress includes restoring sensations of touch and pain, as well as connecting sensors in prosthetic limbs to the brain for haptic feedback. Innovations now enable prosthetic hands and arms to exhibit dexterity similar to human limbs, with brain-controlled mechanisms allowing for precise movement guidance.
![[diag67.svg]]

## 2.4 Unmanned aerial vehicles
The research and development of unmanned aerial vehicles (UAVs), or drones, presents significant potential for advanced control systems. Typically operated by ground controllers, drones do not yet function autonomously, which limits their ability to operate safely in complex airspace, although package delivery by drones is starting to become a reality. 
![[diag68.svg]]

A key challenge is developing control systems to prevent in-air collisions, with the ultimate goal of enabling autonomous operations in applications such as aerial photography, surveying, crop monitoring, and weather observation. An emerging area of interest is the integration of artificial intelligence (AI) with drones, which requires advanced control systems throughout their airframes.
# 3. Engineering design
Engineering design is a central task of the engineer. It is a complex process in which both creativity and analysis play major roles.

> ==**Design is the process of conceiving or inventing the forms, parts, and details of a system to achieve a specific purpose.**==

The design steps are:
1. Determine a need arising from the values of various groups;
2. Specify in detail what the solution to that need must be and to embody these values;
3. Develop and evaluate various alternative solutions to meet these specifications;
4. Decide which one is to be designed in detail and fabricated.

In most cases, design takes place under imposed schedules and we eventually settle for a design that may be less than ideal but considered good enough. *Time is the only competitive advantage*.

A significant challenge for a designer is writing specifications for a technical product. **Specifications** are clear statements that outline what the device or product is supposed to be and do. The design of technical systems focuses on providing suitable design specifications and is based on four key characteristics: 
+ *Design complexity:* stems from the variety of tools, issues, and knowledge involved. The many factors that need to be considered highlight the challenges of the design specification process, including assessing their importance and clearly articulating them in numerical or written form; 
+ *Design trade-offs:* The design process requires resolving conflicting goals that are all desirable. It involves finding an efficient compromise between these conflicting criteria.;
+ *Design gaps and risk :* are intrinsic in the progression from an abstract idea to its realization. This inability to predict with certainty the performance of a technological object which generates major uncertainties as to the real effects of the devices and products designed. These uncertainties are translated by the notion of unforeseen consequences or risks.

In engineering design, there are two fundamental types of thinking: *engineering analysis* and *synthesis*. 
+ **Engineering analysis:** focuses on models of physical systems, providing insights and identifying directions for improvement.
+ **Engineering Synthesis:** is the process of creating new physical configurations based on those insights.

The most effective approach to engineering design involves parameter analysis and optimization. This process includes three key steps: 
1. Identifying the key parameters; 
2. Generating the system configuration;  
3. Evaluating how well the configuration meets the required needs. 

These steps form an iterative loop. Once the key parameters are identified and the configuration is developed, the designer can then optimize those parameters. Typically, the goal is to focus on a limited set of parameters for adjustment.

# 4. Control system design
Control system design is a specific branch of engineering design. The primary objective of control engineering design is to establish the configuration, specifications, and key parameters of a proposed system to address a real-world need. 

The control system design process comprises several essential steps, which can be grouped into three main categories: 
1. Establishing goals and the variables to be controlled, along with defining specifications (metrics) to assess performance. 
2. Defining and modeling the system. 
3. Designing the control system, including integrated system simulation and analysis. This process is illustrated below:

![[diag69.svg]]

# 5. Design example 
+ **Insulin delivery control system**
  Control systems have been employed in the biomedical field to develop implanted automatic drug-delivery systems for patients. These automatic systems can regulate vital parameters such as blood pressure, blood sugar levels, and heart rate. A common application of control engineering is in drug delivery, where mathematical models are used to understand the dose–effect relationships of various medications. 

  An implanted drug-delivery system typically operates as a closed-loop system, especially since miniaturized glucose sensors have become available. The most effective solutions involve individually programmable, pocket-sized insulin pumps designed to administer insulin as needed. 
  
  For a healthy individual, the blood glucose and insulin concentrations are depicted below: 
![[diag70.svg]]
  In the case of diabetic patients, the system must deliver insulin from a reservoir that is implanted in their body. Consequently, the primary control goal is to maintain optimal insulin levels to manage blood sugar effectively.

+ **Control goal:**
  Design a system to regulate the blood sugar concentration of a diabetic by controlled dispensing of insulin.
+ **Variable to be controlled:**
  Blood glucose concentration.
+ **Control design specification:**
  Provide a blood glucose level for the diabetic that closely approximates (tracks) the glucose level of a healthy person

Given the design goals, variables to be controlled, and control design specifications,
we can now propose a preliminary system configuration. A closed-loop system uses
a fully implantable glucose sensor and miniature motor pump to regulate the insulin
delivery rate as shown here:

![[diag71.svg]]

The feedback control system uses a sensor to measure the actual glucose level and compare that level with the desired level, thus turning the motor pump on when it is required.
![[diag72.svg]]
# 6. Summary
In this first part, we discussed open- and closed-loop feedback control systems. In terms of contemporary issues, key areas of application were discussed, including humanoid robots, unmanned aerial vehicles, autonomous automobiles, and embedded control. Finally, the design process was presented in a structured form and included the following steps: the establishment of goals and ­variables to be controlled, definition of specifications, system definition, modeling, and analysis. The iterative nature of design allows us to handle the design gap effectively while accomplishing necessary trade-offs in complexity, performance, and cost.

[[Quiz 01]]

[[Mathematical Models of systems]]

# FRGO: Flexible reshuﬄing growth optimizer for optimization

**Author Lists**： Qingke Zhang*（1） , Hao Gao（1，2） , Gai-Ge Wang（3）, Lei Lyu（1，4）, Junqing Li（5） and Huaxiang Zhang（1）

- （1）School of Information Science and Engineering, Shandong Normal University, Jinan 250358, China
  
- （2）College of Information Science and Engineering, Northeastern University, Shenyang 110819, China

- （3）School of Computer Science and Technology, Ocean University of China, Qingdao 266100, China 
  
- （4）Shandong Provincial Key Laboratory for Novel Distributed Computer Software Technology, Jinan 250358, China

- （5）School of Computer Science and Technology, Liaocheng University, Liaocheng 252000, China



**Abstract**： Evolutionary algorithms (EAs) commonly rely on evolutionary operators with ﬁxed structures to improve solutions. However, this static feature leads individuals to exhibit similar search behavior and weaken the performance of EAs. Conversely, this paper transforms the static logical structure of an operator into a dynamic one using certain rules. This transformation allows the mathematical expression of the operator to evolve randomly, signiﬁcantly enhancing the likelihood of obtaining higher-quality solutions compared to using a static operator. The idea is achieved through a ﬂexible reshuﬄing growth optimizer (FRGO). First, a learning operator is designed to ﬂexibly reshuﬄe its mathematical model, enabling FRGO to adapt to distinct ﬁtness landscapes. Second, a reﬂection operator is proposed that transforms the diﬀerences between Gaussian distribution models into diﬀerences between samples to explore problem spaces. Finally, a dynamic population partitioning strategy is designed to assist the sampling operations. The eﬀectiveness of FRGO is veriﬁed by the component validity and the search behavior analysis. The numerical simulation on the CEC2017, CEC2019, and CEC2022 suites indicates that FRGO is more competitive than nine advanced diﬀerential evolution and particle swarm optimization variants, nine novel metaheuristics, and seven state-of-the-art IEEE CEC competition winners, especially regarding global convergence ability and computational complexity. The source code of the FRGO algorithm is publicly available at https://github.com/tsingke/FRGO.


The paper has been submitted to Elsevier Journal 《Information Sciences》

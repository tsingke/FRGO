# Flexible reshuffling element operators for complex optimization

**Author Lists**： Qingke Zhang*（1） , Hao Gao（1，2） , Zhi-Hui Zhan(3), Gai-Ge Wang（4）, Junqing Li（5） and Huaxiang Zhang（1）
- School of Information Science and Engineering, Shandong Normal University, Jinan 250358, China
  
- College of Information Science and Engineering, Northeastern University, Shenyang 110819, China
  
- College of Artificial Intelligence, Nankai University, Tianjin 300350, China
  
- School of Computer Science and Technology, Ocean University of China, Qingdao 266100, China
  
- School of Computer Science and Technology, Liaocheng University, Liaocheng 252000, China



**Abstract**： Global optimization performance in evolutionary algorithms (EAs) is heavily reliant on the
effectiveness and efficiency of search operators. While current EAs often employ single,
multiple, or hybrid operators for spatial search, these operators are generally pre-defined and
do not change during execution. Such inherent rigidity limits their adaptability to complex
search landscapes, hindering performance on intricate optimization problems. To address this
challenge, we propose a novel variable generative operator construction method. This approach
leverages a fine-grained combinatorial flexible shuffling technique to automatically generate a
diverse set of elementary operators from a finite composition pool and adapt them to the evolving
search environment. This transformation allows the mathematical expression of the operator to
evolve randomly, significantly enhancing the likelihood of obtaining higher-quality solutions
compared to using a static operator. The idea is achieved through a flexible reshuffling growth
optimizer (FRGO). First, a learning operator is designed to flexibly reshuffle its mathematical
model, enabling FRGO to adapt to distinct fitness landscapes. Second, a reflection operator is
proposed that transforms the differences between Gaussian distribution models into differences
between samples to explore problem spaces. Finally, a dynamic population partitioning strategy
is designed to assist the sampling operations. The effectiveness of FRGO is verified by the
component validity and the search behavior analysis. The numerical simulation on the CEC2017,
CEC2019, and CEC2022 suites indicates that FRGO is more competitive than nine advanced
differential evolution and particle swarm optimization variants, nine novel metaheuristics, and
seven state-of-the-art IEEE CEC competition winners, especially regarding global convergence
ability and computational complexity. The source code of the FRGO algorithm is publicly
available at https://github.com/tsingke/FRGO.


*Note:* This research is currently under preparation for submission as a manuscript. Copyright of the work resides with the authors and is provided here for educational purposes only.

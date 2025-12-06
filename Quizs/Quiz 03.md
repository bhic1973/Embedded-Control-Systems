

### Course: Embedded control system 
### Professor: Hicham BELKEBIR 
### Date: 2025-11-23

| Nom : |     |     |     | Prénom : |     |     |     |
| :---- | --- | --- | --- | -------- | --- | --- | --- |
|       |     |     |     |          |     |     |     |



## Questionnaire à Choix Multiples (QCM)

### Thème : Performance des Systèmes à Rétroaction

1. Quel est l'avantage principal des systèmes de commande à rétroaction ?
    
    - [ ] A. Ajuster uniquement la performance transitoire.
    - [ ] B. Ajuster uniquement la performance en régime permanent.
    - [ ] C. Ajuster à la fois la performance transitoire et la performance en régime permanent.
    - [ ] D. Garantir l'instabilité du système.
- 


1. Que permettent d'évaluer les mesures de performance pour le concepteur ?
    
    - [ ] A. Le coût de fabrication du système.
    - [ ] B. La complexité mathématique du système.
    - [ ] C. La qualité du système et de répondre à la question de savoir dans quelle mesure le système accomplit la tâche pour laquelle il a été conçu.
    - [ ] D. L'emplacement des zéros dans le plan s.

2. Quels sont les trois signaux d'entrée de test standard couramment utilisés dans l'analyse des performances des systèmes de commande dans le domaine temporel ?
    
    - [ ] A. L'entrée sinusoïdale, l'entrée impulsionnelle, l'entrée exponentielle.
    - [ ] B. L'entrée échelon, l'entrée rampe, et l'entrée parabolique.
    - [ ] C. L'entrée triangulaire, l'entrée trapézoïdale, l'entrée sinusoïdale.
    - [ ] D. L'entrée de bruit blanc, l'entrée de rampe, l'entrée constante.

3. Quelle est la transformée de Laplace $R(s)$ de l'entrée Rampe $r(t)$ lorsque $r(t)=At$ pour $t>0$ ?
    
    - [ ] A. $\frac{A}{s}$
    - [ ] B. $\frac{A}{s^2}$.
    - [ ] C. $\frac{2A}{s^3}$
    - [ ] D. $\frac{1}{s}$

4. Dans la fonction de transfert en boucle fermée d'un système du second ordre $H_{cl}(s) = \frac{\omega_{n}²}{s²+2\zeta\omega_{n}s + \omega_{n}^2}$, que représente le symbole $\zeta$ ?
    
    - [ ] A. La fréquence naturelle ($\omega_n$).
    - [ ] B. La constante de temps.
    - [ ] C. La fréquence amortie.
    - [ ] D. Le coefficient d'amortissement (_damping ratio_).

5. Comment est défini le temps de montée ($t_r$), l'une des mesures de performance standard ?
    
    - [ ] A. Le temps nécessaire à la sortie pour atteindre sa valeur maximale.
    - [ ] B. Le temps pris par la sortie pour se maintenir dans l'intervalle $[\vert r(t)\vert -\delta,\vert r(t)\vert +\delta]$.
    - [ ] C. Le temps nécessaire à la sortie pour atteindre $90\%$ de la valeur de référence cible.
    - [ ] D. L'erreur entre la sortie finale et la référence.

6. Quelle est la formule fournie pour le temps de pic ($t_p$) pour un système du second ordre ?
    
    - [ ] A. $t_{p} \cong \frac{4}{\omega_{n}\zeta}$
    - [ ] B. $t_{p} = \frac{\pi}{\omega_{n}\sqrt{1-\zeta^2}}$.**
    - [ ] C. $PO = 100\exp(-\frac{\zeta\pi}{\sqrt{1-\zeta^2}})(\%)$
    - [ ] D. $t_{r1}\omega_{n}(\zeta) = 2.23\zeta^2-0.0785\zeta+1.1178$

7. Selon les sources, quelles sont les deux mesures qui représentent la _Rapidité de la réponse_ (_Swiftness of response_) ?
    
    - [ ] A. Le temps de pic et le dépassement en pourcentage.
    - [ ] B. Le temps d'établissement et l'erreur en régime permanent.
    - [ ] C. Le temps de montée et le temps de pic.
    - [ ] D. Le temps de montée et le temps d'établissement.
    - [ ] 
8. Dans l'exemple où $\delta=2\%$ de la valeur finale, à quoi est approximativement égal le temps d'établissement du régime permanent ($t_s$) ?
    
    - [ ] A. $t_{s} \cong \frac{\pi}{\omega_{n}\sqrt{1-\zeta^2}}$
    - [ ] B. $t_{s} \cong \frac{4}{\omega_{n}\zeta}$.
    - [ ] C. $t_{s} \cong \frac{2.23}{\omega_{n}}$
    - [ ] D. $t_{s} \cong \frac{1}{\zeta}$

9. La réponse d'un système du troisième ordre peut être approximée par les racines dominantes du système du second ordre à condition que :
    
    - [ ] A. Le troisième pôle soit à l'origine ($s=0$).
    - [ ] B. Le temps de montée soit égal au temps de pic.
    - [ ] C. Le coefficient d'amortissement soit supérieur à 1 ($\zeta > 1$).
    - [ ] D. La partie réelle des racines dominantes soit inférieure à un dixième de la partie réelle de la troisième racine ($\frac{1}{\gamma}\ge10\zeta\omega_{n}$).

10. Qu'arrive-t-il à la réponse à l'échelon d'un système du second ordre avec un zéro fini lorsque ce zéro s'éloigne davantage dans le demi-plan gauche ($a/\zeta\omega_{n}$ augmente) ?
    
    - [ ] A. L'erreur en régime permanent augmente.
    - [ ] B. Le système devient instable.
    - [ ] C. La réponse à l'échelon approche la réponse du système du second ordre sans zéro.
    - [ ] D. Le temps de pic augmente indéfiniment.

11. En ce qui concerne l'analyse des pôles et des zéros dans le plan s, quel est le rôle des pôles de $H_{cl}(s)$ ?
    
    - [ ] A. Ils déterminent le poids de chaque fonction de mode (rôle des zéros).
    - [ ] B. Ils affectent uniquement la stabilité en régime permanent.
    - [ ] C. Ils dictent les modes de réponse du système.
    - [ ] D. Ils déterminent l'erreur statique uniquement.

12. Que se passe-t-il lorsqu'un zéro est déplacé plus près d'un pôle ($s = -\sigma_i$) ?
    
    - [ ] A. La contribution du mode de réponse associé augmente (résultant en un $A_i$ plus grand).
    - [ ] B. L'erreur en régime permanent diminue.
    - [ ] C. Sa contribution à la sortie du système est réduite (résultant en un $A_i$ plus petit).
    - [ ] D. Le système devient sous-amorti.

13. Quel est l'un des rôles fondamentaux de la rétroaction, justifiant son utilisation malgré son coût et sa complexité accrue ?
    
    - [ ] A. Augmenter la magnitude de l'erreur en régime permanent.
    - [ ] B. Rendre le système intrinsèquement linéaire.
    - [ ] C. L'amélioration de la réduction de l'erreur en régime permanent du système.
    - [ ] D. Éliminer tous les zéros dans le plan s.

14. Comment est définie la constante d'erreur de position $K_p$ pour calculer l'erreur en régime permanent avec une entrée échelon ?
    
    - [ ] A. $K_p = \lim_{s\rightarrow 0} s L(s)$
    - [ ] B. $K_p = L(0)$.
    - [ ] C. $K_p = \lim_{s\rightarrow 0} s^2 L(s)$
    - [ ] D. $K_p = \lim_{t\rightarrow \infty} e(t)$

15. Pour une entrée Rampe (vitesse) avec une pente $A$, si la fonction de transfert en boucle ouverte $L(s)$ est de type $N=1$, quelle est la formule de l'erreur en régime permanent $e_{ss}$ ?
    
    - [ ] A. $e_{ss} = R_0 / (1 + K_p)$
    - [ ] B. $e_{ss} = 0$
    - [ ] C. $e_{ss} = R_0 / K_a$
    - [ ] D. $e_{ss} = A / K_v$ (où $K_v$ est la constante d'erreur de vitesse).

16. Pour un système de commande avec une fonction de transfert en boucle ouverte $L(s)$ ayant un type $N=0$, quelle est la tendance de l'erreur en régime permanent $e_{ss}$ pour une entrée Rampe ?
    
    - [ ] A. $e_{ss} \rightarrow 0$
    - [ ] B. $e_{ss} \rightarrow \infty$.
    - [ ] C. $e_{ss} = R_0 / K_v$
    - [ ] D. $e_{ss} = R_0 / (1+K_p)$

17. Pour une entrée d'Accélération (Parabolique) $r(t)=\frac{R_{0}t²}{2}$, quelle condition sur le nombre de pôles à l'origine ($N$) de $L(s)$ garantit que l'erreur en régime permanent $e_{ss}$ tend vers zéro ?
    
    - [ ] A. $N=0$
    - [ ] B. $N=1$
    - [ ] C. $N=2$
    - [ ] D. $N>2$.

18. Pour qu'un indice de performance soit utile dans la théorie du contrôle moderne, quelle condition essentielle doit-il remplir ?
    
    - [ ] A. Il doit être maximisé par le système.
    - [ ] B. Il doit être négatif.
    - [ ] C. Il doit toujours être un nombre positif ou zéro.
    - [ ] D. Il doit être une fonction uniquement du temps.

19. Quelle méthode relativement simple est utilisée pour réduire l'ordre d'une fonction de transfert de système complexe ?
    
    - [ ] A. Augmenter le nombre de zéros dans la fonction de transfert.
    - [ ] B. Éliminer un pôle insignifiant, spécifiquement un pôle avec une partie réelle négative plus élevée, car il a un effet minimal sur la réponse transitoire du système.
    - [ ] C. Simplifier la fonction en forçant $\zeta = 1$.
    - [ ] D. Multiplier le dénominateur par un terme de premier ordre.
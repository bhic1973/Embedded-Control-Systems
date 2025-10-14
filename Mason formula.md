**Formule de Mason** à ce **Signal Flow Graph (SFG)** pour obtenir la fonction de transfert $H(s) = \frac{Y(s)}{X(s)}$.  On va procéder **étape par étape**, en suivant la méthode générale de Mason.

![[cap29.png]]
---

### 🔹 1. Rappel de la formule de Mason

Pour un SFG, la formule de Mason donne la fonction de transfert globale :

$$ 
H(s) = \frac{Y(s)}{X(s)} = \frac{\sum_{k} P_k \Delta_k}{\Delta}  
$$

où :

- $P_k$  = gain du **k-ième chemin direct** de l’entrée à la sortie,
    
- $\Delta = 1 - \sum (\text{boucles simples}) + \sum (\text{produits de boucles non touchantes deux à deux}) - \sum (\text{produits de boucles non touchantes trois à trois}) + \cdots$
    
- $\Delta_k$ = valeur de $\Delta$ **en ignorant toutes les boucles qui touchent le chemin direct $P_k$**.
    

---

### 🔹 2. Identifier les nœuds

Notons les nœuds comme suit :  
$$  
X(s) = \text{nœud 1},\quad \text{puis successivement jusqu’à Y(s) = nœud 5}.  
$$

- Nœud 1 : entrée $X(s)$
    
- Nœud 2 : après $G_1(s)$ et $G_5(s)$
    
- Nœud 3 : après $G_2(s)$  et $G_6(s)$ 
    
- Nœud 4 : après $G_3(s)$ et $G_7(s)$ 
    
- Nœud 5 : sortie $Y(s)$ , après $G_4(s)$  et $G_8(s)$ 
    

---

### 🔹 3. Identifier les **chemins directs**

On remarque deux **chemins directs indépendants** de $X(s)$  vers $Y(s)$  :

1. **Chemin supérieur :**  
    $$  
    P_1 = G_1(s) G_2(s) G_3(s) G_4(s)  
    $$
    
2. **Chemin inférieur :**  
    $$ 
    P_2 = G_5(s) G_6(s) G_7(s) G_8(s)  
    $$
    

---

### 🔹 4. Identifier les **boucles de rétroaction**

Chaque branche $L_i(s)$  possède une boucle de rétroaction avec un gain $H_i(s)$.  
Ainsi, on a **4 boucles simples** :

$$  
\begin{aligned}  
\text{Boucle 1 : } & L_1(s) \\  
\text{Boucle 2 : } & L_2(s) \\  
\text{Boucle 3 : } & L_3(s) \\  
\text{Boucle 4 : } & L_4(s)  
\end{aligned}  
$$

Donc les **boucles simples** sont :

$$  
\begin{aligned}  
\text{B1: } & -G_2 H_2 \\  
\text{B2: } & -G_3 H_3 \\  
\text{B3: } & -G_6 H_6 \\  
\text{B4: } & -G_7 H_7  
\end{aligned}  
$$

---

### 🔹 5. Identifier les **boucles non touchantes**

- B1 et B2 se touchent (via les mêmes nœuds sur la voie supérieure)
    
- B3 et B4 se touchent (via la voie inférieure)
    
- Aucune boucle du haut ne touche une boucle du bas ⟹  
    **(B1,B2)** ne touchent pas **(B3,B4)**
    

Donc on a une **paire de boucles non touchantes :**

$$  
(\text{B1,B3}), (\text{B1,B4}), (\text{B2,B3}), (\text{B2,B4})  
$$

---

### 🔹 6. Calcul de $\Delta$ 

$$
\begin{aligned}  
\Delta &= 1 - (\text{B1 + B2 + B3 + B4}) + (\text{B1B3 + B1B4 + B2B3 + B2B4}) \\  
&= 1 - [(-G_2H_2) + (-G_3H_3) + (-G_6H_6) + (-G_7H_7)] \\  
&\quad + [(-G_2H_2)(-G_6H_6) + (-G_2H_2)(-G_7H_7) + (-G_3H_3)(-G_6H_6) + (-G_3H_3)(-G_7H_7)] \\  
&= 1 + (G_2H_2 + G_3H_3 + G_6H_6 + G_7H_7) + (G_2G_6H_2H_{6} +
G_{2}G_{7}H_{2}H_{7} + G_{3}G_{6}H_{3}H_{6}\\&\quad + G_{3}G_{7}H_{3}H_{7})  
\end{aligned}  
$$

---

### 🔹 7. Calcul de $\Delta_k$ 

- Pour le **chemin supérieur $P_1$ ** : il est affecté par les boucles $B_1$  et $B_2$ .  
    Donc on **supprime** ces boucles :  
    $$  
    \Delta_1 = 1 - (B_3 + B_4) + (B_3B4)  
    = 1 + (G_6H_6 + G_7H_7) + G_6G_7H_6H_7  
    $$
    
- Pour le **chemin inférieur $P_2$** : il est affecté par les boucles $B_3$ et $B_4$.  
    Donc on **supprime** ces boucles :  
    $$  
    \Delta_2 = 1 + (G_2H_2 + G_3H_3) + G_2G_3H_2H_3  
    $$
    

---

### 🔹 8. Fonction de transfert totale

$$  
H(s) = \frac{Y(s)}{X(s)} = \frac{P_1 \Delta_1 + P_2 \Delta_2}{\Delta}  
$$

avec

$$  
\begin{aligned}  
P_1 &= G_1G_2G_3G_4, \\  
P_2 &= G_5G_6G_7G_8, \\  
\Delta &= 1 + (G_2H_2 + G_3H_3 + G_6H_6 + G_7H_7) + (G_2G_6H_2H_6 +\\&\quad G_2G_7H_2H_7 + G_3G_6H_3H_6 + G_3G_7H_3H_7)  
\end{aligned}  
$$

et

$$  
\begin{aligned}  
\Delta_1 &= 1 + (G_6H_6 + G_7H_7) + G_6G_7H_6H_7, \\  
\Delta_2 &= 1 + (G_2H_2 + G_3H_3) + G_2G_3H_2H_3.  
\end{aligned}  
$$

---

### ✅ Résultat final

$$
\small{  
\boxed{  
H(s) = \frac{  
G_1G_2G_3G_4 \left[1 + (G_6H_6 + G_7H_7) + G_6G_7H_6H_7\right]  
+  
G_5G_6G_7G_8 \left[1 + (G_2H_2 + G_3H_3) + G_2G_3H_2H_3\right]  
}{  
1 + (G_2H_2 + G_3H_3 + G_6H_6 + G_7H_7) + (G_2G_6H_2H_6 + G_2G_7H_2H_7 + G_3G_6H_3H_6 + G_3G_7H_3H_7)  
}  
}
}
$$

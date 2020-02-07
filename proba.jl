A = parser_import("Itineraire_escales_prix.csv")
B = parser_chiffre(A)

function prix_alpha(B)
    L=[]
    C=[]
    #beta=[]
    for i in 1:length(B)
        append!(L,B[i][6])
        append!(C,B[i][5])
        #append!(beta,B[i][])
    end
    return L,C
end

#liste des prix
#liste des alpha
#liste des beta
L1,C1 = prix_alpha(B)


#beta
beta1 = -2
#le temps est fixé a 1

function summ(C, beta, L)
    a = 0
    for i in 1:length(C)
        a = a + exp(C[i] + beta * L[i])
    end
    return a
end

function probabilites(C, beta, L)
    T = []
    S = summ(C,beta,L)
    for i in 1:length(C)
        append!(T, exp(C[i] + beta * L[i] ) / S)
    end
    return T
end

probabilites(C1,beta1,L1)

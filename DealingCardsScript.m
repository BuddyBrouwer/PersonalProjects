clear, clc
syms J Q K A Hearts Clubs Diamonds Spades %Allows for variables to be used in matrices
Values = [2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A]; %initialize card values
Suits = [Hearts; Clubs; Diamonds; Spades]; %Initialize card suits
Deck_Matrix = Values.*Suits; %Matrix multiplication of the values and suits
Deck_Array = reshape(Deck_Matrix.', 1 , []); %Creates an array from the existing matrix making it easier to remove cards to ensure no repeats
Num_players = input('How many players are playing? '); %User input how many players are playing
Num_cards = input('How many cards does each player need? '); %User input how many cards each player needs
i = 1; %Initialize iteration of number of players
j = 1; %Initialize iteration of number of cards
CardsInDeck = numel(Deck_Array); %Number of cards in deck for random function

while i <= Num_players %This condition runs while i is less than or equal to the number of players
    Players{1,i} = i; %This sets the first row as the player number to make reading easier
    while j <= Num_cards %This condition runs while j is less than or equal to the number of cards needed for each player
        f = randi(CardsInDeck); %f is a random number from the number of cards left in deck
        Players{j+1,i} = Deck_Array(f); %Uses the random number f to find the corresponding value from the Deck_array
        Deck_Array(f) = []; %Index locates card in the f position and removes it from the Deck_array
        CardsInDeck = CardsInDeck - 1; %removes one card from the deck to account for the removed card
        
        j = j + 1; %iterates to the next card for the current player
    end
    i = i + 1; %iterates to the next player
    j = 1; %reinitializes j to rerun the inner loop
end

P = symmatrix(Players); %Used symmatrix to create a visible matrix with PLayers matrix, otherwise only displays syms
pretty(P) %Puts P into a reader friendly form


    




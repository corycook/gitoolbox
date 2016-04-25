function String = RandomStringGenerator(LetterStore, maxlength)

    %LetterStore = '10';

    n = ceil(maxlength*rand(1));

    String = LetterStore(ceil(length(LetterStore).*rand(1,n)));
end 

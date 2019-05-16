pragma solidity ^0.5.6;

contract OwnedToken {
    // TokenCreator — это тип контракта, который определен ниже.
    // Это нормально, если он не используется для 
    // создания нового контракта.
    TokenCreator creator;
    address owner;
    string name;
    
    // Это конструктор контракта.
    constructor (string memory _name) public {
        // Глобальные переменные доступны по имени
        // и не доступны, например, через this.owner. Это также
        // относится к функциям, и особенно внутри конструктора,
        // их можно вызвать только так ("внутренне"),
        // потому что сам контракт еще не существует.
        owner = msg.sender;
        // Выполняется явное преобразование типа из `address`
        // в `TokenCreator` и предполагается, что тип
        // вызывающего контракта — TokenCreator. Нет 
        // реального способа это проверить.
        creator = TokenCreator(owner);
        name = _name;
    }

    function changeName(string memory newName) public {
        // Только создатель контракта может изменить имя.
        // Сравнение возможно с того момента, когда контракты
        // конвертированы в адреса.
        if (msg.sender == address(creator)) {
            name = newName;
        }
    }

    function transfer(address newOwner) public {
        // Только текущий собственник может переводить
        // токены.
        require(newOwner != address(0x0));
        if (msg.sender != owner) {return;}
        // Заметьте, что здесь вызывается функция,
        // которая объявлена в контракте ниже. Если
        // вызов не удался, то выполнение здесь 
        // немедленно остановится.
        if (creator.isTokenTransferOK(owner, newOwner)) {
            owner = newOwner;
        }
    }
}

contract TokenCreator {
    function createToken(string memory name)
       public
       returns (OwnedToken tokenAddress)
    {
        // Создание нового Токена и возврат его адрес.
        // Возвращаемый тип — просто `address`,
        // так как это самый закрытый тип в ABI.
        return new OwnedToken(name);
    }

    function changeName(OwnedToken tokenAddress, string memory name)  public {
        // И снова внешний тип `tokenAddress` — это
        // просто `address`.
        tokenAddress.changeName(name);
    }

    function isTokenTransferOK(address currentOwner, address newOwner)
        public
        view
        returns (bool)
    {
        // Проверка некоторого произвольного условия.
        address tokenAddress = msg.sender;
        require(tokenAddress != address(0x0));
        require(currentOwner != address(0x0));
        require(newOwner != address(0x0));
        return true;
    }
}

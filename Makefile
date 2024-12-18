CC = g++
CFLAGS = -Wall -std=c++17
SRC = main.cpp FuncA.cpp  
OBJ = $(SRC:.cpp=.o)
EXEC = main  

# Правило для створення виконуваного файлу
$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC)

# Правило для компіляції окремих файлів у об'єктні
$(OBJ): %.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

# Правило для очищення
clean:
	rm -f $(OBJ) $(EXEC)

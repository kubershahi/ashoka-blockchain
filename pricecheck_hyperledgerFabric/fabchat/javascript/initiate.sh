cd ..

./teardownFabChat.sh

sleep 5

./startFabChat.sh

cd javascript

node enrollAdmin

# creating three users 
node registerUser user1
node registerUser user2
node registerUser user3

## creat items for users 
node invoke createMsg user1 Iphone 90000 u1@gmail.com
node invoke createMsg user2 Chair 2000 u2@gmail.com
node invoke createMsg user3 Laptop 50000 u3@gmail.com

node query user1 -1

# propose items price
node invoke proposeMsg user1 0 95000
node invoke proposeMsg user2 0 92000

node query user1 0

## flag item prices
node invoke flagMsg user1 0
node invoke flagMsg user2 0
node invoke flagMsg user3 0

node query user1 0

# propose other items
node query user2 1
node invoke flagMsg user1 1

# reset fields upon reproposing
node invoke proposeMsg user2 1 2500
node invoke flagMsg user1 1

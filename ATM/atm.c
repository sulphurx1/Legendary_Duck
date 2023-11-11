#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void checkBalance(float balance) {
    printf("Your balance is Rs. %.2f\n", balance);
}

float deposit(float balance, float amount) {
    balance += amount;
    printf("Rs. %.2f has been deposit into your account. Your new balance is Rs. %.2f\n", amount, balance);

    return balance;
}

float withdraw(float balance, float amount) {
    if(balance < amount) {
        printf("Insufficient funds.\nYour balance is Rs. %.2f\n", balance);
    }

    else {
        balance -= amount;
        printf("Rs. %.2f has been withdrawn from your account.\nYour new balance is Rs. %.2f\n", amount, balance);     
    }

    return balance;
}

float transfer(float balance, float amount, float *target_balance) {
    if(balance < amount) {
        printf("Insufficient funds.\nYour balance is Rs. %.2f\n", balance);
    }

    else {
        balance -= amount;
        *target_balance += amount;
    }

    return balance;
}

float credit(float balance, float amount, float verification_balance) {
    verification_balance = 0.3 * balance;

    if(verification_balance < amount) {
        printf("Elagible for credit");
    }

    else {
        balance += amount;
        printf("Rs. %.2f has been credited to your account.\nYour new balance is Rs. %.2f\n", amount, balance);     
    }

    return balance;
    
}

int main()
{

    while(1) {

        char username[50], input[50], target_username[50], searched_username[50];
        int pin, input_pin, i, j;
        float balance, amount, target_balance, verification_balance;

        FILE * user_data;
        FILE * temp_file;

        user_data = fopen("user_data.txt", "r");
        temp_file = fopen("temp_file.txt", "w");

        printf("************** Welcome to the ATM **************\n");
        printf("Please enter username: ");
        scanf("%s", &input);


        while(fscanf(user_data, "%s %d %f", &username, &pin, &balance) != EOF) {
            if(strcmp(input, username) == 0) {
                                
                do{

                    printf("Please enter your pin: ");
                    scanf("%d", &input_pin);
                    if(input_pin == pin) {
                        while(1) {
                            printf("************** Welcome to the ATM **************\n");
                            printf("1. Check Balance\n");
                            printf("2. Deposit\n");
                            printf("3. Withdraw\n");
                            printf("4. Transfer\n");
                            printf("5. Credit\n");
                            printf("6. Exit\n");
                            printf("Please enter your choice: ");
                            scanf("%d", &j);

                            switch(j) {
                                case 1:
                                    checkBalance(balance);
                                    break;
                                case 2:
                                    printf("Please enter the amount you want to deposit: ");
                                    scanf("%f", &amount);
                                    balance = deposit(balance, amount);
                                    break;
                                case 3:
                                    printf("Please enter the amount you want to withdraw: ");
                                    scanf("%f", &amount);
                                    balance = withdraw(balance, amount);
                                    break;

                                case 4:
                                    printf("Please the user to transfer to: ");
                                    scanf("%s", &target_username);

                                    if(strcmp(target_username, username) == 0) {
                                        printf("You cannot transfer to yourself.\n");
                                        break;
                                    }
                                    
                                    else if(strcmp(target_username, "6") == 0) {
                                        break;
                                    }

                                    else {

                                        printf("Please enter the amount you want to transfer: ");
                                        scanf("%f", &amount);
                                        while(fscanf(user_data, "%s %d %f", &searched_username, &pin, &target_balance) != EOF) {
                                            
                                            if(strcmp(target_username, searched_username) == 0) {

                                                balance = transfer(balance, amount, &target_balance);

                                                printf("Rs. %.2f has been transfered to %s's account.\n", amount, target_username); 
                                                break;
                                            }                                                                              

                                        }

                                    }

                                case 5:

                                    printf("The amount should not be less than Rs. 50\n");
                                    printf("Please enter the amount you want to credit: ");

                                    scanf("%f", &amount);

                                    if(amount < 50 && amount != 6) {
                                        printf("The amount should not be less than Rs. 50\n");
                                        break;
                                    }

                                    else if(amount == 6) {
                                        break;
                                    }

                                    else {

                                        balance = credit(balance, amount, verification_balance);
                                        break;

                                    }                                    
                                
                                case 6:
                                    printf("Thank you for using the ATM.\n");
                                    break;
                                default:
                                    printf("Invalid choice.\n");
                                    break;
                            }
                            if(j == 6) {
                                break;
                            }
                        }
                    }
                    else {
                        printf("Incorrect pin.\n");
                        printf("You have %d attempts left.\n", 3 - i);
                        i++;
                    }

                    if(j == 6) {
                        break;
                    }
                }
                while(i != 4);
            }
            fprintf(temp_file, "%s %d %.2f\n", username, pin, balance);
        }

        fclose(user_data);
        fclose(temp_file);

        if(j == 6) {

            remove("user_data.txt");
            rename("temp_file.txt", "user_data.txt");

            break;
        }
    }
    return 0;
}

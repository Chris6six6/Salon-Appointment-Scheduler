#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?" 

  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do 
      echo "$SERVICE_ID) $NAME"
    done

  read SERVICE_ID_SELECTED

  # if input is not a number
  if ! [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    # send to main menu
    MAIN_MENU "That is not a valid service number."
  else
    # service availability
    ID_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $ID_SELECTED ]]; then
      # send to main menu with an error message
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      # get customer info
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      # if customer doesn't exist
      if [[ -z $CUSTOMER_NAME ]]; then
        # get new customer name
        echo -e "\nWhat's your name?"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      echo -e "\nWhat time would you like your service, $CUSTOMER_NAME?"
      read SERVICE_TIME

      # insert appointment
      INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $ID_SELECTED, '$SERVICE_TIME')")
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$ID_SELECTED'") 
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU

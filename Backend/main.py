import sqlite3
import random
from datetime import date

conn = sqlite3.connect('dbase3.db')

curs = conn.cursor()

curs.execute('select * from Shoe')
colnames = [desc[0] for desc in curs.description]
rowdicts = []
for row in curs.fetchall():
    rowdicts.append( dict(zip(colnames, row)) )
for row in rowdicts: print(row)

cart = [0]
cart.remove(0)

customer_id = random.randrange(31, 99)
customer_info = [str(customer_id)]

select_task = input("Input 1 to pick a shoe to put in your cart, "
                    "2 to remove a shoe from your cart, "
                    "3 to check out, "
                    "or 0 to exit the program: ")

while int(select_task) != 0:
    if int(select_task) == 1:
        shoe_id = input("Input shoe_id number to put it in your cart, or 0 to stop: ")
        while int(shoe_id) != 0:
            cart.append(int(shoe_id))
            shoe_id = input("Input shoe_id number to put it in your cart, or 0 to stop: ")
        print(cart)

    if int(select_task) == 2:
        remove_shoe_id = input("Input shoe_id number to remove it from your cart, or 0 to stop: ")
        while int(remove_shoe_id) != 0:
            cart.remove(int(remove_shoe_id))
            remove_shoe_id = input("Input shoe_id number to remove it from your cart, or 0 to stop: ")
        print(cart)

    if int(select_task) == 3:
        name = input("Input your name: ")
        address = input("Input your address: ")
        city = input("Input your city: ")
        state = input("Input your state: ")
        zip_code = input("Input your zip code: ")
        phone = input("Input your phone number: ")
        email = input("Input your email: ")

        customer_info.append(name)
        customer_info.append(address)
        customer_info.append(city)
        customer_info.append(state)
        customer_info.append(zip_code)
        customer_info.append(phone)
        customer_info.append(email)

        print(cart)
        print(customer_info)

        curs.execute('insert into Customer values (?, ?, ?, ?, ?, ?, ?, ?)', (customer_id, name, address, city, state, zip_code, phone, email))
        curs.execute('select * from Customer')
        print(curs.fetchall())

        customer_invoice_id = random.randrange(31, 99)
        today = date.today()
        shipping_charge = random.randrange(1, 100)
        curs.execute('insert into CustomerInvoice values (?, ?, ?, ?)',
                     (customer_invoice_id, customer_id, today, shipping_charge))
        curs.execute('select * from CustomerInvoice')
        print(curs.fetchall())

        for x in cart:
            curs.execute('insert into CustomerOrder values (?, ?, ?, ?)',
                     (random.randrange(31, 999), x, 1, customer_invoice_id))

        curs.execute('select * from CustomerOrder')
        print(curs.fetchall())

        conn.commit()

        print("Thank you for your purchase, here is your invoice: ")
        curs.execute('SELECT Customer.customer_name, CustomerInvoice.customer_invoice_id, CustomerInvoice.order_date, Shoe.shoe_name, Supplier.supplier_name AS Brand, Shoe.sale_price, CustomerOrder.quantity, CustomerInvoice.shipping_charges, 0.1 AS Tax, ((Shoe.sale_price * CustomerOrder.quantity + CustomerInvoice.shipping_charges) * 1.1) AS TotalPrice, Customer.address FROM Shoe, Supplier, CustomerOrder, CustomerInvoice, Customer WHERE CustomerInvoice.customer_invoice_id = ? AND CustomerOrder.shoe_id = Shoe.shoe_id AND CustomerOrder.customer_invoice_id = CustomerInvoice.customer_invoice_id AND Shoe.supplier_id = Supplier.supplier_id AND CustomerInvoice.customer_id = Customer.customer_id AND CustomerOrder.quantity < Shoe.quantity',(customer_invoice_id,))
        for row in curs.fetchall():
            print(row)

        break

    select_task = input("Input 1 to pick a shoe to put in your cart, "
                            "2 to remove a shoe from your cart, "
                            "3 to check out, "
                            "or 0 to exit the program: ")




#!/usr/bin/env python
import csv

'''
written on Feb. 19th, 2021

Since `dlmread` can't read text file, we need to 
regenerate csv file.

Run this script(or download "cleanTSEData.csv")
to clean your csv file.

The header of this csv file(though, it's not included 
since matlab can't read the file:

year,month,date,hour,minute,second,saros

Index it as you want to.
'''

# CHANGE HERE IF YOU NEED TO
file_path = "tse2001to2020.csv"
output_file = "cleanTSEData.csv"

string_builder = "" # haha java stuff right here LOL

with open(file_path) as data_file:
    csv_reader = csv.reader(data_file, delimiter=',')

    # just to get some index correctly
    month_index = 2
    day_index = 3
    year_index = 4
    time_index = 5
    saros_index = 6

    first_row = True

    # rebuild csv
    for row in csv_reader:

        # Skip first row because dlm can't read csv header
        if first_row:
            first_row = False
            continue;

        # with format of HH:MM:SS
        t = row[time_index]
        t = t.split(":")

        # re-construction done here
        string_builder += "{},{},{},{},{},{},{}\n".format(
                row[year_index],
                row[month_index],
                row[day_index],
                t[0],
                t[1],
                t[2],
                row[saros_index]
            )


# Write and done
with open(output_file, "w+") as data:
    data.write(string_builder)
            

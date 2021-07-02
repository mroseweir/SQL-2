-- Copy, paste, and run the insert statement from the delete section above. (You should have deleted all the entries.)

-- Add a column to the animals table called “location”. It should have a VARCHAR data type.

ALTER TABLE animals ADD Location VARCHAR;

-- Insert 3 new animals into the table – make sure none of their fields are null.

INSERT INTO animals ( name, type, age, location )
VALUES ( 'Michael', 'Tiger', '8', 'The Zoo' ), ( 'Thomas', 'Meercat', '2', 'Africa' ), ( 'Luke', 'Snake', '6', 'The Amazon' );

-- Change the “type” column’s name to be “species”.

ALTER TABLE animals RENAME COLUMN type TO species;

-- Change the “species” column data type to be VARCHAR.

ALTER TABLE animals ALTER COLUMN species TYPE VARCHAR;
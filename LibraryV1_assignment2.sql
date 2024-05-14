--Shana Szanzer
--9/28/2023

--SELECT statement that returns the titles, ISBN numbers, and locations of all the books
SELECT Title, ISBN, Location
FROM LBR_Book boo JOIN LBR_Location loc
ON boo.Location_ID = loc.Location_ID

--SELECT statement that returns the titles of all books, their categories, genres, fields, subfields, and types
SELECT [Title], [Category], [Genre], [Field], [Subfield], [Type]
FROM LBR_Book boo Left JOIN LBR_BookClassification boocl
ON boo.Classification_ID = boocl.Classification_ID
Left JOIN LBR_BkCategory cat
ON boocl.Category_ID = cat.Category_ID
Left JOIN LBR_BkGenre gen
ON boocl.Genre_ID = gen.Genre_ID
Left JOIN LBR_BkField fie
ON boocl.Field_ID = fie.Field_ID
Left JOIN LBR_BkSubField sub
ON boocl.SubField_ID = sub.Subfield_ID
Left JOIN LBR_BkType typ
ON boocl.Type_ID = typ.Type_ID
ORDER BY Title;

--replace NULL with NA
SELECT COALESCE(boo.title, 'N/A') AS Title,
    COALESCE(cat.category, 'N/A') AS Category,
    COALESCE(gen.genre, 'N/A') AS Genre,
    COALESCE(fie.field, 'N/A') AS Field,
    COALESCE(sub.subfield, 'N/A') AS Subfield,
    COALESCE(typ.type, 'N/A') AS Type
FROM LBR_Book boo Left JOIN LBR_BookClassification boocl
ON boo.Classification_ID = boocl.Classification_ID
Left JOIN LBR_BkCategory cat
ON boocl.Category_ID = cat.Category_ID
Left JOIN LBR_BkGenre gen
ON boocl.Genre_ID = gen.Genre_ID
Left JOIN LBR_BkField fie
ON boocl.Field_ID = fie.Field_ID
Left JOIN LBR_BkSubField sub
ON boocl.SubField_ID = sub.Subfield_ID
Left JOIN LBR_BkType typ
ON boocl.Type_ID = typ.Type_ID
ORDER BY Title;

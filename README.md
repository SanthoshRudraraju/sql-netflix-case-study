# sql-netflix-case-study
![Netflix_logo](https://github.com/SanthoshRudraraju/sql-netflix-case-study/blob/main/netflix_logo.jpg)
# 🎬 Netflix SQL Analysis

A comprehensive SQL-based analysis of the Netflix dataset using PostgreSQL. This project explores content trends, ratings, genres, actors, and more through 15 business-driven queries.

---

## 📌 Project Overview

This project analyzes Netflix's content library to answer key business questions using SQL. The dataset includes information about movies and TV shows such as title, director, cast, country, release year, rating, duration, genre, and description.

---

## 🗃️ Dataset

- **Source:** [Netflix Movies and TV Shows – Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)
- **Table Name:** `netflix`
- **Total Columns:** 12
- **Key Fields:** `show_id`, `type`, `title`, `director`, `casts`, `country`, `date_added`, `release_year`, `rating`, `duration`, `listed_in`, `description`

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| PostgreSQL | Database & query execution |
| pgAdmin / DBeaver | SQL IDE |
| GitHub | Version control |

---

## 📊 Business Problems Solved

| # | Question |
|---|----------|
| 1 | Count the number of Movies vs TV Shows |
| 2 | Find the most common rating for Movies and TV Shows |
| 3 | List all movies released in a specific year |
| 4 | Find the top 5 countries with the most content |
| 5 | Identify the longest movie |
| 6 | Find content added in the last 5 years |
| 7 | Find all movies/TV shows by director 'Rajiv Chilaka' |
| 8 | List all TV shows with more than 5 seasons |
| 9 | Count the number of content items in each genre |
| 10 | Find top 5 years with highest average content release in India |
| 11 | List all movies that are documentaries |
| 12 | Find all content without a director |
| 13 | Find how many movies actor 'Salman Khan' appeared in last 10 years |
| 14 | Find top 10 actors in the highest number of Indian movies |
| 15 | Categorize content as 'Bad' or 'Good' based on keywords in description |

---

## 🔍 Key SQL Concepts Used

- `GROUP BY`, `ORDER BY`, `LIMIT`
- `RANK()` window function with `PARTITION BY`
- `UNNEST()` + `STRING_TO_ARRAY()` for multi-value columns
- `TO_DATE()` for date conversion
- `ILIKE` for case-insensitive pattern matching
- `EXTRACT()` for year-based filtering
- `CTE (WITH clause)` for readability
- `CASE WHEN` for conditional categorization
- Subqueries and correlated queries

---

## 📁 Project Structure

```
netflix-sql-analysis/
│
├── dataset/
│   └── netflix_titles.csv        # Raw dataset
│
├── queries/
│   └── netflix_analysis.sql      # All 15 SQL queries
│
└── README.md                     # Project documentation
```

---

## 🚀 How to Run

1. Install [PostgreSQL](https://www.postgresql.org/download/)
2. Create a database and run the table creation script
3. Import the Netflix CSV dataset into the `netflix` table
4. Run queries from `queries/netflix_analysis.sql`

```sql
-- Create Table
CREATE TABLE NETFLIX (
    SHOW_ID VARCHAR(6),
    TYPE VARCHAR(10),
    TITLE VARCHAR(150),
    DIRECTOR VARCHAR(250),
    CASTS VARCHAR(1000),
    COUNTRY VARCHAR(150),
    DATE_ADDED VARCHAR(50),
    RELEASE_YEAR INT,
    RATING VARCHAR(10),
    DURATION VARCHAR(15),
    LISTED_IN VARCHAR(100),
    DESCRIPTION VARCHAR(250)
);
```

---

## 💡 Sample Insights

- **Movies dominate** Netflix's content library over TV Shows
- **TV-MA** is the most common rating across both content types
- **United States, India, and UK** are the top content-producing countries
- A significant portion of content **lacks director information**
- Content with keywords like **'kill'** or **'violence'** is categorized as Bad content

---

## 🙋‍♂️ Author

**Santhosh**  
📧 santhoshvarma2004@gmail.com  
🔗 [LinkedIn](http://linkedin.com/in/santhosh-rudraraju-7b2988314) | [GitHub](https://github.com/SanthoshRudraraju)


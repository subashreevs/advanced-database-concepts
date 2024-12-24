# Query Optimization Assignment

This assignment is designed to help you understand the basics of query optimization using Python and pandas.

## Assignment Structure

The assignment script is primarily structured around the following components:

### 1. Data Generation

The `generate_data` function produces synthetic data based on a specified strategy such as 'unique', 'repeated', etc. These strategies emulate different types of data distribution.

The `generate_synthetic_data_v5` function creates multiple tables with various data distributions using the `generate_data` function.

### 2. Basic Operators

The following functions are basic operators provided:

- `pandas_equi_join`: Equi-join between two tables.
- `pandas_multi_way_join`: Multi-way join over a list of tables. Note that you may flip the join order for multi way joins.
- `filter_relation`: Filters rows of a table based on a value range for a given column.

### 3. Example Queries

The `example_basic` function showcases how the provided functions can be utilized to perform various operations like filtering and joining.

### 4. Assignment Queries

Students are expected to implement the following queries:

- `q1`: Simple join between two tables.
- `q2`: Filtering operation on one table.
- `q3`: Join two tables with a filter applied.
- `q4` to `q8`: More complex queries involving multi-way joins, filters, and optimized join orders.

## How to Proceed

1. **Understanding Data Generation**: Familiarize yourself with the data generation process. Look at how different strategies produce varying data distributions.

2. **Basic Operators**: Understand the basic operations like join and filter. Look at the `example_basic` function to see these operations in action.

3. **Assignment Queries**: Each function `q1` to `q8` corresponds to a SQL-like query described in its docstring. Your task is to implement these queries using the given basic operators. Some queries may also require you to optimize the join order or push down filters to enhance performance.

### Helpful Hints

- **Filter Push Down**: Always consider if you can filter the data before performing a join. Smaller data results in faster joins.
  
- **Join Order**: The order in which you join tables can significantly impact performance. Try to join smaller tables first or use knowledge about data distributions to optimize the join order.

- **Use Provided Functions**: Make the most of the provided basic operators. They will save you time and keep your solutions concise.

## Execution

At the end of the script, there's an "Execution" section that generates the synthetic data, runs the example queries, and executes your implemented queries.

## How to Submit

After implementing the queries, make sure to test them. Once you're confident in your solutions, submit the assignment script with your implementations.

Good luck, and happy hacking!

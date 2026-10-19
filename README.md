# Sustainability Impact Analysis | SQL

## Project Overview
This project uses SQL to analyze a hypothetical dataset about electronic device repurposing and estimate its potential environmental benefits. The analysis examines energy savings and carbon dioxide (CO₂) reductions across device types, device ages, and geographic regions.

**Project type:** Academic / portfolio project  
**Tools:** SQL, data aggregation, Common Table Expressions (CTEs), window functions, conditional logic

## Business Questions
- How do estimated energy savings differ between laptops and desktops?
- Which device age groups have the greatest estimated environmental impact?
- How do estimated CO₂ savings vary across geographic regions?
- What device repurposing strategies could maximize potential environmental benefits?

## Key Findings
- **601,740 joined records** were analyzed.
- The dataset estimated approximately **6,768 metric tons of annual CO₂ savings** across the analyzed records.
- Older devices had the highest estimated per-device annual savings, at approximately **48.02 kWh of energy and 21.01 kg of CO₂**.
- Laptops represented the largest share of analyzed devices and had slightly higher estimated average energy savings than desktops.
- Average estimated CO₂ savings varied by region, potentially reflecting differences in electricity grid carbon intensity.

## Methods
SQL techniques used in the analysis included:
- Table joins to combine device and environmental impact data
- `CASE` statements to categorize devices by age
- Common Table Expressions (CTEs) to organize multi-step queries
- Aggregate functions to compare energy and CO₂ savings
- Window functions to examine the percentage contribution of device types to regional savings

## Recommendations
Based on the hypothetical dataset, organizations could consider:
1. Prioritizing older devices for repurposing when they remain functional and suitable for reuse.
2. Evaluating laptops as a major opportunity because of their large share of the analyzed devices.
3. Considering regional differences in estimated CO₂ savings when prioritizing sustainability initiatives.

## Limitations
This is an academic portfolio project using hypothetical/illustrative data. The findings are estimates from the provided dataset and should not be interpreted as verified environmental outcomes or as work commissioned by Intel. Actual savings would depend on device condition, energy use, replacement decisions, and regional electricity emissions factors.

## Skills Demonstrated
SQL joins, CTEs, conditional logic, aggregation, window functions, environmental data analysis, sustainability metrics, and communicating data-driven recommendations.

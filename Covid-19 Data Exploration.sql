/* Covid 19 Data Exploration

Skills used: Joins, Windows Functions, Aggregate Functions, Creating Views, & Converting Data Types
*/

Select *
from covid_deaths
where continent is not null
order by 3,4


-- Selecting Data that I will use first

Select Location, dat, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
Where continent is not null 
order by 1,2


-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

select location, dat, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from covid_deaths
where location like 'United St%'
and continent is not null
order by 1,2


-- Total Cases vs Population
-- Shows what precentage of population is infected with Covid

select location, dat, population, total_cases, (total_cases/population)*100 as percent_population_infected
from covid_deaths
order by 1,2


-- Displays Countries with the Highest Infection Rate compared to Population

select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as percent_population_infected
from covid_deaths
group by location, population
order by percent_population_infected desc


-- Shows Countries with the Highest Death Count per Population

select location, max(cast(total_deaths as int)) as Total_Death_Count
from covid_deaths
where continent is not null
group by location
order by Total_Death_Count desc


-- Breaking things down by Continent
-- Displays Continents with the Highest Death Count per Population

select continent, max(cast(total_deaths as int)) as Total_Death_Count
from covid_deaths
where continent is not null
group by continent
order by Total_Death_Count desc


-- Global Numbers 

select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from covid_deaths
where continent is not null
order by 1,2


-- Global Number by Day

select dat, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from covid_deaths
where continent is not null
group by dat
order by 1,2


--  Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

select dea.continent, dea.location, dea.dat, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.dat) as RollingPeopleVaccinated
from covid_deaths dea
join covid_vaccinations vac
on dea.location = vac.location 
and dea.dat = vac.dat
where dea.continent is not null


-- Creating View to Store Data for later Visualization

create view PercentPopulationVaccinated as
select dea.continent, dea.location, dea.dat, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.dat) as RollingPeopleVaccinated
from covid_deaths dea
join covid_vaccinations vac
on dea.location = vac.location 
and dea.dat = vac.dat
where dea.continent is not null


select * from PercentPopulationVaccinated




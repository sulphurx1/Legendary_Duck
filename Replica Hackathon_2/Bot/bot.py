import discord
from discord.ext import commands
import psycopg2 as psy
import random
from info import *
from login import *

# Create a new Discord bot client
bot = commands.Bot(command_prefix='!', intents=discord.Intents.all())

@bot.event
async def on_ready():
    channel = bot.get_channel(CHANNEL_ID)
    await channel.send('Link The Megatron Clowns is online!')

# connect to the PostgreSQL database
connection = psy.connect(
    host = HOSTNAME, 
    user = USERNAME, 
    password = PASSWORD, 
    dbname = DATABASE
)

@bot.command()
async def news(ctx):
    # Open a cursor to perform database operations
    cursor = connection.cursor()

    # Execute a SELECT query to retrieve data from table
    cursor.execute("SELECT title, creator, image_url, pubDate FROM news ORDER BY RANDOM() LIMIT 1")

    # Fetch the result from the query
    result = cursor.fetchone()
    message = f"**{result[0]}**\n{result[1]}\n{result[2]}\n{result[3]}"
    await ctx.send(message)
    
    # Close the cursor
    cursor.close()

# Run the bot using Discord bot token
bot.run(BOT_TOKEN)
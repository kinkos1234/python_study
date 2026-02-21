import streamlit as st

st.header('st.checkbox')

st.write('what would you like to order?')

icecream = st.checkbox('Ice cream')
coffee = st.checkbox('Coffee')
cola = st.checkbox('Cola')

if icecream:
    st.write('Great! Here is your ice cream 🍨')
if coffee:
    st.write('Great! Here is your coffee ☕')
if cola:
    st.write('Great! Here is your cola 🥤')
import streamlit as st

st.header('st.selectbox')

options = st.selectbox(
    'What is your favorite color?',
    ('Blue', 'Green', 'Red'))

st.write('Your favorite color is:', options)
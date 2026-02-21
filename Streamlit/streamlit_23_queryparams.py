import streamlit as st

st.title('st.query_params')

with st.expander('About this app'):
    st.write("`st.query_params` allows the retrieval of query parameters directly from the URL of the user's browser.")

st.header('1. Instructions')
st.markdown('''
In the above URL bar of your internet browser, append the following:
`?firstname=Jack&surname=Beanstalk`
after the base URL `http://localhost:8501/`
such that it becomes
`http://localhost:8501/?firstname=Jack&surname=Beanstalk`
''')

st.header('2. Contents of st.query_params')
st.write(st.query_params.to_dict())

st.header('3. Retrieving and displaying information from the URL')

firstname = st.query_params.get('firstname', '')
surname = st.query_params.get('surname', '')

st.write(f'Hello **{firstname} {surname}**, how are you?')

import airflow
import os
from airflow.models import DAG
from airflow.operators.bash import BashOperator

# Get current directory
cwd = os.getcwd()
cwd = cwd + '/include/'

# Define the default arguments
args = {
    'owner': 'your_name',
    'start_date': airflow.utils.dates.days_ago(1),
}

# Instantiate the DAG passing the args as default_args
dag = DAG(
    dag_id='example_run_R_script',
    default_args=args,
    schedule_interval=None
)

# Define the tasks:
A_get_users = BashOperator(
    task_id='A_get_users',
    bash_command=f'{cwd}run_r.sh {cwd}A_task.R ',
    dag=dag,
    )

B_user_counts_by_gender = BashOperator(
    task_id='B_user_counts_by_gender',
    bash_command=f'{cwd}run_r.sh {cwd}B_task.R ',
    dag=dag,
    )

C_user_counts_by_age = BashOperator(
    task_id='C_user_counts_by_age',
    bash_command=f'{cwd}run_r.sh {cwd}C_task.R ',
    dag=dag,
    )

# Define the task dependencies
A_get_users >> B_user_counts_by_gender
A_get_users >> C_user_counts_by_age
def example_run_R_script():
    """
    This script defines a DAG (Directed Acyclic Graph) for running R scripts using Airflow.
    It consists of three tasks:
    - A_get_users: Runs the R script A_task.R
    - B_user_counts_by_gender: Runs the R script B_task.R
    - C_user_counts_by_age: Runs the R script C_task.R
    
    The tasks are executed in the order specified by the task dependencies.
    """
    pass

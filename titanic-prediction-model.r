{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "246075eb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:19.952010Z",
     "iopub.status.busy": "2025-12-11T22:01:19.949629Z",
     "iopub.status.idle": "2025-12-11T22:01:21.299837Z",
     "shell.execute_reply": "2025-12-11T22:01:21.297854Z"
    },
    "papermill": {
     "duration": 1.359448,
     "end_time": "2025-12-11T22:01:21.302428",
     "exception": false,
     "start_time": "2025-12-11T22:01:19.942980",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘dplyr’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    filter, lag\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    intersect, setdiff, setequal, union\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: ggplot2\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: scales\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘scales’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:readr’:\n",
      "\n",
      "    col_factor\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: ggridges\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "New to ggformula?  Try the tutorials: \n",
      "\tlearnr::run_tutorial(\"introduction\", package = \"ggformula\")\n",
      "\tlearnr::run_tutorial(\"refining\", package = \"ggformula\")\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "randomForest 4.7-1.1\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Type rfNews() to see new features/changes/bug fixes.\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘randomForest’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:ggplot2’:\n",
      "\n",
      "    margin\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    combine\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "#read in pkgs - switched to R\n",
    "library(dplyr)\n",
    "library(readr)\n",
    "library(ggformula)\n",
    "library(randomForest)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "c4aa4625",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:21.342959Z",
     "iopub.status.busy": "2025-12-11T22:01:21.313093Z",
     "iopub.status.idle": "2025-12-11T22:01:21.814073Z",
     "shell.execute_reply": "2025-12-11T22:01:21.812233Z"
    },
    "papermill": {
     "duration": 0.509683,
     "end_time": "2025-12-11T22:01:21.816698",
     "exception": false,
     "start_time": "2025-12-11T22:01:21.307015",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m891\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (5): Name, Sex, Ticket, Cabin, Embarked\n",
      "\u001b[32mdbl\u001b[39m (7): PassengerId, Survived, Pclass, Age, SibSp, Parch, Fare\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m418\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m11\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (5): Name, Sex, Ticket, Cabin, Embarked\n",
      "\u001b[32mdbl\u001b[39m (6): PassengerId, Pclass, Age, SibSp, Parch, Fare\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m418\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m2\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[32mdbl\u001b[39m (2): PassengerId, Survived\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "train = read_csv('/kaggle/input/titanic/train.csv')\n",
    "test = read_csv('/kaggle/input/titanic/test.csv')\n",
    "gender_submission = read_csv('/kaggle/input/titanic/gender_submission.csv')\n",
    "\n",
    "#head(train)\n",
    "#head(test)\n",
    "#head(gender_submission)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "2e36e3e1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:21.830260Z",
     "iopub.status.busy": "2025-12-11T22:01:21.828647Z",
     "iopub.status.idle": "2025-12-11T22:01:21.867268Z",
     "shell.execute_reply": "2025-12-11T22:01:21.865480Z"
    },
    "papermill": {
     "duration": 0.048615,
     "end_time": "2025-12-11T22:01:21.870327",
     "exception": false,
     "start_time": "2025-12-11T22:01:21.821712",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.74203821656051"
      ],
      "text/latex": [
       "0.74203821656051"
      ],
      "text/markdown": [
       "0.74203821656051"
      ],
      "text/plain": [
       "[1] 0.7420382"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#take a look at the data and explore\n",
    "\n",
    "#what % of women survived?\n",
    "train2 <-\n",
    "    train %>%\n",
    "    mutate(woman_survive = case_when(\n",
    "        Sex == \"female\" & Survived == 1 ~ TRUE, \n",
    "        TRUE ~ FALSE)) %>%\n",
    "    mutate(is_woman = case_when(\n",
    "        Sex == \"female\" ~ TRUE,\n",
    "        TRUE ~ FALSE\n",
    "    ))\n",
    "\n",
    "#percent of women that survive as a percentage of women, not of all passengers\n",
    "women_survival_rate <- sum(train2$woman_survive)/sum(train2$is_woman)\n",
    "women_survival_rate"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "38f7ce1f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:21.884071Z",
     "iopub.status.busy": "2025-12-11T22:01:21.882456Z",
     "iopub.status.idle": "2025-12-11T22:01:21.914430Z",
     "shell.execute_reply": "2025-12-11T22:01:21.912656Z"
    },
    "papermill": {
     "duration": 0.041513,
     "end_time": "2025-12-11T22:01:21.916925",
     "exception": false,
     "start_time": "2025-12-11T22:01:21.875412",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.188908145580589"
      ],
      "text/latex": [
       "0.188908145580589"
      ],
      "text/markdown": [
       "0.188908145580589"
      ],
      "text/plain": [
       "[1] 0.1889081"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#now the menfolk\n",
    "train3 <-\n",
    "    train2 %>%\n",
    "    mutate(man_survive = case_when(\n",
    "        Sex == \"male\" & Survived == 1 ~ TRUE, \n",
    "        TRUE ~ FALSE)) %>%\n",
    "    mutate(is_man = case_when(\n",
    "        Sex == \"male\" ~ TRUE,\n",
    "        TRUE ~ FALSE\n",
    "    ))\n",
    "\n",
    "train3 <-\n",
    "    train3 %>%\n",
    "    mutate(woman_survive = case_when(\n",
    "        Sex == \"female\" & Survived == 1 ~ TRUE, \n",
    "        TRUE ~ FALSE)) %>%\n",
    "    mutate(is_woman = case_when(\n",
    "        Sex == \"female\" ~ TRUE,\n",
    "        TRUE ~ FALSE\n",
    "    ))\n",
    "\n",
    "men_survival_rate <- sum(train3$man_survive)/sum(train3$is_man)\n",
    "men_survival_rate"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "db212280",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:21.931074Z",
     "iopub.status.busy": "2025-12-11T22:01:21.929440Z",
     "iopub.status.idle": "2025-12-11T22:01:21.991891Z",
     "shell.execute_reply": "2025-12-11T22:01:21.989466Z"
    },
    "papermill": {
     "duration": 0.072426,
     "end_time": "2025-12-11T22:01:21.994616",
     "exception": false,
     "start_time": "2025-12-11T22:01:21.922190",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 9 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>AgeBand</th><th scope=col>Total</th><th scope=col>Survived</th><th scope=col>SurvivalRate</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0-10 </td><td> 64</td><td>38</td><td>0.5937500</td></tr>\n",
       "\t<tr><td>11-20</td><td>116</td><td>44</td><td>0.3793103</td></tr>\n",
       "\t<tr><td>21-30</td><td>231</td><td>84</td><td>0.3636364</td></tr>\n",
       "\t<tr><td>31-40</td><td>155</td><td>69</td><td>0.4451613</td></tr>\n",
       "\t<tr><td>41-50</td><td> 84</td><td>33</td><td>0.3928571</td></tr>\n",
       "\t<tr><td>51-60</td><td> 42</td><td>17</td><td>0.4047619</td></tr>\n",
       "\t<tr><td>71-80</td><td> 18</td><td> 4</td><td>0.2222222</td></tr>\n",
       "\t<tr><td>81-90</td><td>  4</td><td> 1</td><td>0.2500000</td></tr>\n",
       "\t<tr><td>NA   </td><td>177</td><td>52</td><td>0.2937853</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 9 × 4\n",
       "\\begin{tabular}{llll}\n",
       " AgeBand & Total & Survived & SurvivalRate\\\\\n",
       " <fct> & <int> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0-10  &  64 & 38 & 0.5937500\\\\\n",
       "\t 11-20 & 116 & 44 & 0.3793103\\\\\n",
       "\t 21-30 & 231 & 84 & 0.3636364\\\\\n",
       "\t 31-40 & 155 & 69 & 0.4451613\\\\\n",
       "\t 41-50 &  84 & 33 & 0.3928571\\\\\n",
       "\t 51-60 &  42 & 17 & 0.4047619\\\\\n",
       "\t 71-80 &  18 &  4 & 0.2222222\\\\\n",
       "\t 81-90 &   4 &  1 & 0.2500000\\\\\n",
       "\t NA    & 177 & 52 & 0.2937853\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 9 × 4\n",
       "\n",
       "| AgeBand &lt;fct&gt; | Total &lt;int&gt; | Survived &lt;int&gt; | SurvivalRate &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| 0-10  |  64 | 38 | 0.5937500 |\n",
       "| 11-20 | 116 | 44 | 0.3793103 |\n",
       "| 21-30 | 231 | 84 | 0.3636364 |\n",
       "| 31-40 | 155 | 69 | 0.4451613 |\n",
       "| 41-50 |  84 | 33 | 0.3928571 |\n",
       "| 51-60 |  42 | 17 | 0.4047619 |\n",
       "| 71-80 |  18 |  4 | 0.2222222 |\n",
       "| 81-90 |   4 |  1 | 0.2500000 |\n",
       "| NA    | 177 | 52 | 0.2937853 |\n",
       "\n"
      ],
      "text/plain": [
       "  AgeBand Total Survived SurvivalRate\n",
       "1 0-10     64   38       0.5937500   \n",
       "2 11-20   116   44       0.3793103   \n",
       "3 21-30   231   84       0.3636364   \n",
       "4 31-40   155   69       0.4451613   \n",
       "5 41-50    84   33       0.3928571   \n",
       "6 51-60    42   17       0.4047619   \n",
       "7 71-80    18    4       0.2222222   \n",
       "8 81-90     4    1       0.2500000   \n",
       "9 NA      177   52       0.2937853   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#what is age distribution of survivors?\n",
    "age_bands <- c(0,11,21,31,41,51,61,71,81,91, Inf)\n",
    "age_labels <- c(\"0-10\", \"11-20\", \"21-30\", \"31-40\", \"41-50\", \"51-60\", \"71-80\", \"81-90\", \"91-100\", \"NA\")\n",
    "\n",
    "age_survival <-\n",
    "    train3 %>%\n",
    "    mutate(AgeBand = cut(Age, breaks=age_bands, labels=age_labels, right = FALSE)) %>%\n",
    "    group_by(AgeBand) %>%\n",
    "    summarise(\n",
    "        Total = n(),\n",
    "        Survived = sum(Survived==1),\n",
    "        SurvivalRate = Survived/Total\n",
    "    ) \n",
    "\n",
    "age_survival"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "e13323c5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:22.009871Z",
     "iopub.status.busy": "2025-12-11T22:01:22.008251Z",
     "iopub.status.idle": "2025-12-11T22:01:22.054855Z",
     "shell.execute_reply": "2025-12-11T22:01:22.053041Z"
    },
    "papermill": {
     "duration": 0.057334,
     "end_time": "2025-12-11T22:01:22.057340",
     "exception": false,
     "start_time": "2025-12-11T22:01:22.000006",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Survived</th><th scope=col>mean_age</th><th scope=col>median_age</th><th scope=col>mode_age</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td>30.62618</td><td>28</td><td>21</td></tr>\n",
       "\t<tr><td>1</td><td>28.34369</td><td>28</td><td>24</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Survived & mean\\_age & median\\_age & mode\\_age\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0 & 30.62618 & 28 & 21\\\\\n",
       "\t 1 & 28.34369 & 28 & 24\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 4\n",
       "\n",
       "| Survived &lt;dbl&gt; | mean_age &lt;dbl&gt; | median_age &lt;dbl&gt; | mode_age &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| 0 | 30.62618 | 28 | 21 |\n",
       "| 1 | 28.34369 | 28 | 24 |\n",
       "\n"
      ],
      "text/plain": [
       "  Survived mean_age median_age mode_age\n",
       "1 0        30.62618 28         21      \n",
       "2 1        28.34369 28         24      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#what is the mean, median, mode of age?\n",
    "\n",
    "#calc mode - no built in dplyr, grrr\n",
    "mode_first <- function(x, na.rm = TRUE) {\n",
    "  if (na.rm) x <- x[!is.na(x)]\n",
    "  if (length(x) == 0) return(NA)\n",
    "  ux <- unique(x)\n",
    "  ux[which.max(tabulate(match(x, ux)))]\n",
    "}\n",
    "\n",
    "#now get summary table\n",
    "summary_stats <-\n",
    "    train3 %>%\n",
    "    group_by(Survived) %>%\n",
    "    summarise(\n",
    "        mean_age = mean(Age, na.rm=TRUE),\n",
    "        median_age = median(Age, na.rm=TRUE),\n",
    "        mode_age = mode_first(Age)\n",
    "        )\n",
    "\n",
    "summary_stats \n",
    "#not really that informative\n",
    "#slightly right skewed\n",
    "#i think its ok to use mean in this case since mean and median are pretty close"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "bfbf47a9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:22.072185Z",
     "iopub.status.busy": "2025-12-11T22:01:22.070568Z",
     "iopub.status.idle": "2025-12-11T22:01:22.105536Z",
     "shell.execute_reply": "2025-12-11T22:01:22.103778Z"
    },
    "papermill": {
     "duration": 0.044995,
     "end_time": "2025-12-11T22:01:22.108046",
     "exception": false,
     "start_time": "2025-12-11T22:01:22.063051",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#time for data cleanup\n",
    "\n",
    "#recode Survived as factor, not dbl\n",
    "train3$Survived <- \n",
    "    as.factor(train3$Survived) \n",
    "\n",
    "#filter out 2 rows w/ missing Embarked values\n",
    "train3 <- train3%>%\n",
    "    filter(!is.na(train3$Embarked), )\n",
    "\n",
    "#impute missing Age vals with mean\n",
    "mean_age <- mean(train3$Age, na.rm=TRUE)\n",
    "\n",
    "train3_age_imputed <- train3 %>%\n",
    "    mutate(Age = if_else(is.na(Age),mean_age,Age))\n",
    "\n",
    "#now build subset of data for model training\n",
    "train4 <-\n",
    "    train3_age_imputed %>%\n",
    "    select (Pclass, Sex, SibSp, Parch, Survived, Embarked, Age)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "ce2d5df7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:22.122328Z",
     "iopub.status.busy": "2025-12-11T22:01:22.120743Z",
     "iopub.status.idle": "2025-12-11T22:01:22.670010Z",
     "shell.execute_reply": "2025-12-11T22:01:22.667867Z"
    },
    "papermill": {
     "duration": 0.559447,
     "end_time": "2025-12-11T22:01:22.672808",
     "exception": false,
     "start_time": "2025-12-11T22:01:22.113361",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       " randomForest(formula = Survived ~ ., data = train4, ntree = 500,      mtry = floor(sqrt(p)), importance = TRUE, classwt = class_weights) \n",
       "               Type of random forest: classification\n",
       "                     Number of trees: 500\n",
       "No. of variables tried at each split: 1\n",
       "\n",
       "        OOB estimate of  error rate: 23.28%\n",
       "Confusion matrix:\n",
       "    0   1 class.error\n",
       "0 394 155   0.2823315\n",
       "1  52 288   0.1529412"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#let's build a RF model w class weights to account for low n of survivors\n",
    "\n",
    "#set seed\n",
    "set.seed(1)\n",
    "\n",
    "#compute p\n",
    "p <- length(ncol(train4) - 1) #subtract 1 for target var\n",
    "\n",
    "#set some class weights\n",
    "class_counts <- table(train4$Survived)\n",
    "class_weights <- as.list(min(class_counts) / class_counts)\n",
    "\n",
    "\n",
    "#build the model\n",
    "model <- randomForest(formula = Survived ~ .,\n",
    "                      data=train4, \n",
    "                      ntree=500, \n",
    "                      mtry=floor(sqrt(p)),\n",
    "                      importance=TRUE,\n",
    "                      classwt=class_weights                      \n",
    "                     ) \n",
    "\n",
    "model\n",
    "\n",
    "#plot out important variables\n",
    "#varImpPlot(model, main = \"Random Forest Variable Importance\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "722dc672",
   "metadata": {
    "papermill": {
     "duration": 0.005479,
     "end_time": "2025-12-11T22:01:22.683861",
     "exception": false,
     "start_time": "2025-12-11T22:01:22.678382",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "\n",
    "Call:\n",
    " randomForest(formula = Survived ~ ., data = train4, ntree = 500,      mtry = floor(sqrt(p)), importance = TRUE, classwt = class_weights) \n",
    "               Type of random forest: classification\n",
    "                     Number of trees: 500\n",
    "No. of variables tried at each split: 1\n",
    "\n",
    "        OOB estimate of  error rate: 23.28%\n",
    "Confusion matrix:\n",
    "    0   1 class.error\n",
    "0 394 155   0.2823315\n",
    "1  52 288   0.1529412"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "27eff404",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:22.698547Z",
     "iopub.status.busy": "2025-12-11T22:01:22.696944Z",
     "iopub.status.idle": "2025-12-11T22:01:23.174784Z",
     "shell.execute_reply": "2025-12-11T22:01:23.173082Z"
    },
    "papermill": {
     "duration": 0.48799,
     "end_time": "2025-12-11T22:01:23.177339",
     "exception": false,
     "start_time": "2025-12-11T22:01:22.689349",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       " randomForest(formula = Survived ~ ., data = train4, ntree = 500,      mtry = floor(sqrt(p)), importance = TRUE, sampsize = sampsize_vec) \n",
       "               Type of random forest: classification\n",
       "                     Number of trees: 500\n",
       "No. of variables tried at each split: 1\n",
       "\n",
       "        OOB estimate of  error rate: 18.45%\n",
       "Confusion matrix:\n",
       "    0   1 class.error\n",
       "0 487  62   0.1129326\n",
       "1 102 238   0.3000000"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#try it again with stratified sampling\n",
    "\n",
    "#set seed\n",
    "set.seed(1)\n",
    "\n",
    "#compute p\n",
    "p <- length(ncol(train4) - 1) #subtract 1 for target var\n",
    "\n",
    "#set sample size \n",
    "min_class_n <- min(class_counts)\n",
    "sampsize_vec <- rep(min_class_n, length(class_counts))\n",
    "\n",
    "#build the model\n",
    "model2 <- randomForest(formula = Survived ~ .,\n",
    "                      data=train4, \n",
    "                      ntree=500, \n",
    "                      mtry=floor(sqrt(p)),\n",
    "                      importance=TRUE,\n",
    "                      sampsize = sampsize_vec\n",
    "                     ) \n",
    "\n",
    "model2\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "85618e47",
   "metadata": {
    "papermill": {
     "duration": 0.005578,
     "end_time": "2025-12-11T22:01:23.189270",
     "exception": false,
     "start_time": "2025-12-11T22:01:23.183692",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Call:\n",
    " randomForest(formula = Survived ~ ., data = train4, ntree = 500,      mtry = floor(sqrt(p)), importance = TRUE, sampsize = sampsize_vec) \n",
    "               Type of random forest: classification\n",
    "                     Number of trees: 500\n",
    "No. of variables tried at each split: 1\n",
    "\n",
    "        OOB estimate of  error rate: 18.45%\n",
    "Confusion matrix:\n",
    "    0   1 class.error\n",
    "0 487  62   0.1129326\n",
    "1 102 238   0.3000000"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "b3389521",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:23.203948Z",
     "iopub.status.busy": "2025-12-11T22:01:23.202337Z",
     "iopub.status.idle": "2025-12-11T22:01:23.604394Z",
     "shell.execute_reply": "2025-12-11T22:01:23.602582Z"
    },
    "papermill": {
     "duration": 0.411856,
     "end_time": "2025-12-11T22:01:23.606698",
     "exception": false,
     "start_time": "2025-12-11T22:01:23.194842",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n+OLEiRPh4eF265uSkhISEtKoUaNly5a5fZxMu33ambXOKR/oOmja9Tev2TX/ZI+tzcWDL4hI\n3ZH2VyQ08DfZrjtJOvfdTVan0cSdrlwjFxAVrzvRdX3BggUi8uqrr2Zf9NFHH4nItGnTXD8q\nFDZF9Bo7al0+KFnrFi1aJCIvvfRS9kWTJ08WkcmTJ7t+VCiEiuQ1dmnX9g7bEW80ler7eOes\n8y2J27/+fuO20VPl2ekiYjSVEpHEo4k3Ptp6MjVdvEVEjKZwEQlrtOjMhi4uGjpug6ioqCZN\nmkycONHPz2/YsGG2mzmlpqbOmDFj+PDh1apV69evn7vHCOQHtQ6ZHnjggRYtWkyZMsXf33/E\niBF+fn4iYrFYZs6cOXTo0CpVqvTv39/dY4RynBIPHXHw+/YiUvb+H+3mp1viy3h5iMhP56/p\nup6WfNzboPmXei5rm4TTn4rI9W+Kpdfy9fQt0S39xn4OfDNm8ODB/1xOuY3r4A6i4rtYm9jY\n2Pr164uI2Wxu3bp1u3btbGekq1ateuDAAXePDoVCUTxjR63LH1Vr3blz5yIjI7MXusqVK+/b\nt8/do0Nh4cRa57obFH8+8l8R6TWxtd18g0fQx61Li8joaXtFxOhV9rMOZRPOfPLCN9tsDayW\nc28+PCrrI2Y8VT3p/IIO7yzKvI331SO/dnz27Rlfbqjn73l7VwPOExoaun79+hkzZtSvXz8m\nJmbz5s1Vq1YdP3781q1bq1Sp4u7RAflErUNWISEha9asmTlzZoMGDWJiYjZt2lS1atUPP/xw\n27Zt1apVc/fooCKnxMNbSr643KhpJnNkijWHpfExr4qIT4mHbH9aEnd1qBSgacZGbaP6P9Wz\nYUVzcN3n7/Lz9Avra2uQnnLq4eqBIhJSrWGPvs891qNDoIfBYPR/d+Vp16yOK4mi72IBRxS5\nM3bUunyj1uFOVvTO2O3/bGS6rlfuNcmU032Xgmq9V9ffdO38wk/OJIqIh2+tX3fHjHqiS8L+\nv79dsKJEy5e2bJh6KjXddsWJiBhMpefu2Dl1WN8yaad/nfXF0g2H63d+6od/D7/RupRrVgcA\nckStA+BeLr3diYO2rl+XYghu3Oi/c9RpSTGefneVabP4xIqObhyYW2iaFh0dPXfuXHcPBHCD\n2rVri0hMTIy7B3JbUOuyotbhTubEWue6a+wcN/uRDs2a3bMtwZI5Z8uMgSLS+u167hsUADgZ\n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\nCIIdAACARvw/o+YnulR3XigAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nQCP+H73DbFD9OMX2AAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#plot out important variables\n",
    "\n",
    "#class wts version\n",
    "varImpPlot(model, main = \"Random Forest Variable Importance - Class Wts\")\n",
    "\n",
    "#sampsize stratify version\n",
    "varImpPlot(model2, main = \"Random Forest Variable Importance - SampSize Vec\")\n",
    "\n",
    "#In every model it looks like Sex, Class, and Age play an important role"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ae9e113f",
   "metadata": {
    "papermill": {
     "duration": 0.0078,
     "end_time": "2025-12-11T22:01:23.621865",
     "exception": false,
     "start_time": "2025-12-11T22:01:23.614065",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Overall, even though the samplesize_vec approach leads to slightly better OOB performance, the class wt distribution approach results in slightly better performancde specifically for the survivor group\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "e32315f0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:23.640044Z",
     "iopub.status.busy": "2025-12-11T22:01:23.638437Z",
     "iopub.status.idle": "2025-12-11T22:01:23.681408Z",
     "shell.execute_reply": "2025-12-11T22:01:23.679589Z"
    },
    "papermill": {
     "duration": 0.055051,
     "end_time": "2025-12-11T22:01:23.684084",
     "exception": false,
     "start_time": "2025-12-11T22:01:23.629033",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#let's use model 1 with the class wts bc it has slightly better performance for the survivors group\n",
    "#now assign a 1/0 prediction to each passenger using the model\n",
    "pred_class <- predict(model,newdata=train4, type=\"response\")\n",
    "\n",
    "pred_result <-\n",
    "    train4 %>%\n",
    "    mutate(pred_class = pred_class)\n",
    "\n",
    "#pred_result"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "54c5c8ec",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:23.702713Z",
     "iopub.status.busy": "2025-12-11T22:01:23.701151Z",
     "iopub.status.idle": "2025-12-11T22:01:23.724593Z",
     "shell.execute_reply": "2025-12-11T22:01:23.722743Z"
    },
    "papermill": {
     "duration": 0.035813,
     "end_time": "2025-12-11T22:01:23.727143",
     "exception": false,
     "start_time": "2025-12-11T22:01:23.691330",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#prepare test data\n",
    "\n",
    "#filter out any rows w/ missing Embarked values\n",
    "test2 <- test%>%\n",
    "    filter(!is.na(test$Embarked), )\n",
    "\n",
    "#impute missing Age vals with mean\n",
    "mean_age <- mean(test2$Age, na.rm=TRUE)\n",
    "\n",
    "test_data_age_imputed <- test2 %>%\n",
    "    mutate(Age = if_else(is.na(Age),mean_age,Age))\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "5f09ccb5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-12-11T22:01:23.745227Z",
     "iopub.status.busy": "2025-12-11T22:01:23.743605Z",
     "iopub.status.idle": "2025-12-11T22:01:23.786165Z",
     "shell.execute_reply": "2025-12-11T22:01:23.784296Z"
    },
    "papermill": {
     "duration": 0.055104,
     "end_time": "2025-12-11T22:01:23.789374",
     "exception": false,
     "start_time": "2025-12-11T22:01:23.734270",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#now run it against the test\n",
    "predictor <- predict(model,newdata=test_data_age_imputed, type=\"response\")\n",
    "pred_result_test <-\n",
    "    test_data_age_imputed %>%\n",
    "    mutate(survival_prediction = predictor)\n",
    "\n",
    "#only incl cols for the submission\n",
    "pred_result_test_csv <-\n",
    "    pred_result_test %>%\n",
    "    select(PassengerId,survival_prediction)\n",
    "\n",
    "write.csv(pred_result_test_csv, \"titanic_predictions.csv\", row.names = FALSE)\n"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "databundleVersionId": 26502,
     "sourceId": 3136,
     "sourceType": "competition"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 7.834892,
   "end_time": "2025-12-11T22:01:23.918226",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2025-12-11T22:01:16.083334",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

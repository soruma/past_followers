export type Maybe<T> = T | null;
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
  ISO8601DateTime: any;
};


export type PastFollower = {
   __typename?: 'PastFollower';
  createdAt: Scalars['ISO8601DateTime'];
  followersCount?: Maybe<Scalars['Int']>;
  id: Scalars['ID'];
  updatedAt: Scalars['ISO8601DateTime'];
  userId: Scalars['Int'];
};

export type Query = {
   __typename?: 'Query';
  pastFollower: PastFollower;
  pastFollowers: Array<PastFollower>;
  user: User;
  users: Array<User>;
};


export type QueryPastFollowerArgs = {
  id: Scalars['ID'];
};


export type QueryPastFollowersArgs = {
  userId: Scalars['ID'];
};


export type QueryUserArgs = {
  id: Scalars['ID'];
};

export type User = {
   __typename?: 'User';
  createdAt: Scalars['ISO8601DateTime'];
  description?: Maybe<Scalars['String']>;
  id: Scalars['ID'];
  name?: Maybe<Scalars['String']>;
  pastFollowers: Array<PastFollower>;
  profileImageUrl?: Maybe<Scalars['String']>;
  screenName?: Maybe<Scalars['String']>;
  updatedAt: Scalars['ISO8601DateTime'];
};

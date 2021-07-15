import * as functions from "firebase-functions";
import * as meetup from "./meetup";

export const meetupGetData = functions.https.onCall(() =>
  meetup.getData());

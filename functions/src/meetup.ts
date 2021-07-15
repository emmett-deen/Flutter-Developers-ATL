import axios from "axios";

/**
 * @return {Promise<any>}
 */
export async function getData(): Promise<unknown> {
  const response = await axios.get("https://www.meetup.com/flutter-developers-atl/events/rss/");
  if (response.status === 200) {
    return response.data;
  } else {
    console.error(response.statusText);
    return null;
  }
}

